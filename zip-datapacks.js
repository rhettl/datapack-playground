#!/usr/bin/env node

import { promises as fs } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createReadStream, createWriteStream } from 'fs';
import archiver from 'archiver';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Extract version from pack.mcmeta
async function getVersion(datapackPath) {
  const packMetaPath = path.join(datapackPath, 'pack.mcmeta');
  try {
    const content = await fs.readFile(packMetaPath, 'utf-8');
    const match = content.match(/"version"\s*:\s*"([^"]*)"/);
    return match ? match[1] : '1.0.0';
  } catch {
    return '1.0.0';
  }
}

// Preprocess a single .mcfunction file
async function preprocessMcfunction(filePath) {
  const content = await fs.readFile(filePath, 'utf-8');

  // Remove inline comments (#:) and collapse continuation lines
  const processed = content
    .replace(/\r\n/g, '\n')  // normalize to Unix line endings
    .replace(/#:.*$/gm, '')
    .replace(/\n[\t ]+/g, ' ');

  await fs.writeFile(filePath, processed, 'utf-8');
}

// Preprocess all .mcfunction files in a directory
async function preprocessDatapack(datapackPath) {
  console.log('  Preprocessing .mcfunction files...');

  async function processDir(dir) {
    const entries = await fs.readdir(dir, { withFileTypes: true });

    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        await processDir(fullPath);
      } else if (entry.name.endsWith('.mcfunction')) {
        await preprocessMcfunction(fullPath);
      }
    }
  }

  await processDir(datapackPath);
}

// Zip a directory
async function zipDirectory(sourceDir, outPath) {
  return new Promise((resolve, reject) => {
    const output = createWriteStream(outPath);
    const archive = archiver('zip', { zlib: { level: 9 } });

    output.on('close', resolve);
    archive.on('error', reject);

    archive.pipe(output);
    archive.directory(sourceDir, false);
    archive.finalize();
  });
}

// Process and zip a single datapack
async function zipDatapack(datapackName) {
  const sourcePath = path.join(__dirname, 'datapacks', datapackName);
  const version = await getVersion(sourcePath);
  const tempPath = path.join(__dirname, 'build', 'temp', datapackName);
  const outputName = `${datapackName}-${version}.zip`;
  const outputPath = path.join(__dirname, 'build', outputName);

  console.log(`Processing ${datapackName} (version ${version})...`);

  // Ensure build directory exists
  await fs.mkdir(path.join(__dirname, 'build', 'temp'), { recursive: true });

  // Clean temp directory for this datapack if it exists
  try {
    await fs.rm(tempPath, { recursive: true, force: true });
  } catch {}

  // Copy datapack to temp
  console.log('  Copying to temp...');
  await fs.cp(sourcePath, tempPath, { recursive: true });

  // Preprocess the datapack
  await preprocessDatapack(tempPath);

  // Create zip
  console.log('  Creating zip...');
  await zipDirectory(tempPath, outputPath);

  console.log(`✓ Created build/${outputName}`);

  // Clean up temp directory
  // await fs.rm(tempPath, { recursive: true, force: true });
}

// Main
async function main() {
  const args = process.argv.slice(2);

  // Clean entire temp directory before processing
  const tempDir = path.join(__dirname, 'build', 'temp');
  try {
    console.log('Cleaning build/temp...');
    await fs.rm(tempDir, { recursive: true, force: true });
  } catch {}

  if (args.length === 0) {
    // No arguments: process all datapacks
    const datapacksDir = path.join(__dirname, 'datapacks');
    try {
      const entries = await fs.readdir(datapacksDir, { withFileTypes: true });
      for (const entry of entries) {
        if (entry.isDirectory()) {
          await zipDatapack(entry.name);
        }
      }
    } catch (err) {
      console.error('Error: datapacks/ directory not found');
      process.exit(1);
    }
  } else {
    // Process specific datapacks
    for (const datapackName of args) {
      const datapackPath = path.join(__dirname, 'datapacks', datapackName);
      try {
        await fs.access(datapackPath);
        await zipDatapack(datapackName);
      } catch {
        console.log(`Warning: datapacks/${datapackName} not found, skipping...`);
      }
    }
  }

  // Clean up temp directory at the end
  // try {
    // await fs.rm(tempDir, { recursive: true, force: true });
  // } catch {}

  console.log('Done!');
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});