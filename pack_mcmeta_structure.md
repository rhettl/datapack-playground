# Complete pack.mcmeta Structure Reference

## Basic Structure (Most Common)

```json
{
  "pack": {
    "pack_format": 48,
    "description": "Your pack description here"
  }
}
```

## Full Structure (All Properties)

```json
{
  "pack": {
    "description": "String or Text Component",
    "pack_format": "Int (deprecated in newer versions)",
    "min_format": "Int or [Int, Int]",
    "max_format": "Int or [Int, Int]",
    "supported_formats": "Int, [Int, Int], or {min_inclusive: Int, max_inclusive: Int}"
  },
  "overlays": {
    "entries": [
      {
        "formats": "Int, [Int, Int], or {min_inclusive: Int, max_inclusive: Int}",
        "directory": "String (a-z, 0-9, _, -)"
      }
    ]
  },
  "filter": {
    "block": [
      {
        "namespace": "String",
        "path": "String (regex pattern)"
      }
    ]
  },
  "features": {
    "enabled": ["String (feature flags)"]
  },
  "language": {
    "language_code": {
      "name": "String",
      "region": "String",
      "bidirectional": "Bool"
    }
  }
}
```

## Property Details

### pack (Required)
Main pack metadata section.

#### description (Required)
- **Type:** String or Text Component
- **Description:** Text shown in pack selection menu
- **Examples:**
  ```json
  "description": "My Custom Pack"
  ```
  ```json
  "description": {
    "translate": "pack.mypack.description",
    "color": "gold"
  }
  ```

#### pack_format (Deprecated)
- **Type:** Int
- **Description:** Pack format version for single version support
- **Note:** Deprecated since 1.21.9 (25w31a). Use `min_format` and `max_format` instead.
- **Examples:**
  - `48` = Minecraft 1.21.x
  - `41` = Minecraft 1.20.5-1.20.6
  - `26` = Minecraft 1.20.2-1.20.4

#### min_format (Modern)
- **Type:** Int or [Int, Int]
- **Description:** Minimum pack format version supported
- **Format:** `[major, minor]` or just `major`
- **Examples:**
  ```json
  "min_format": 88
  "min_format": [88, 0]
  ```

#### max_format (Modern)
- **Type:** Int or [Int, Int]
- **Description:** Maximum pack format version supported
- **Format:** `[major, minor]` or just `major`
- **Examples:**
  ```json
  "max_format": 88
  "max_format": [88, 0]
  ```

#### supported_formats (Modern)
- **Type:** Int, [Int, Int], or Object
- **Description:** Alternative way to specify version range
- **Examples:**
  ```json
  "supported_formats": 42
  "supported_formats": [42, 45]
  "supported_formats": {
    "min_inclusive": 42,
    "max_inclusive": 45
  }
  ```

### overlays (Optional)
Apply different files for different Minecraft versions.

#### entries
- **Type:** Array of Objects
- **Description:** List of overlay configurations
- **Example:**
  ```json
  "overlays": {
    "entries": [
      {
        "formats": 48,
        "directory": "overlay_1_21"
      },
      {
        "formats": {"min_inclusive": 41, "max_inclusive": 46},
        "directory": "overlay_1_20"
      }
    ]
  }
  ```

### filter (Optional)
Exclude specific files from packs below this one.

#### block
- **Type:** Array of Objects
- **Description:** Files to filter out
- **Properties:**
  - `namespace` (String): Resource namespace
  - `path` (String): Regex pattern for file paths
- **Example:**
  ```json
  "filter": {
    "block": [
      {
        "namespace": "minecraft",
        "path": "textures/.*\\.png"
      }
    ]
  }
  ```

### features (Optional)
Enable experimental features.

#### enabled
- **Type:** Array of Strings
- **Description:** List of feature flag IDs to enable
- **Example:**
  ```json
  "features": {
    "enabled": [
      "minecraft:trade_rebalance",
      "minecraft:update_1_21"
    ]
  }
  ```

### language (Optional, Resource Packs Only)
Add custom languages.

- **Type:** Object with language codes as keys
- **Properties per language:**
  - `name` (String): Display name
  - `region` (String): Region name
  - `bidirectional` (Bool): Whether text is bidirectional
- **Example:**
  ```json
  "language": {
    "en_pirate": {
      "name": "Pirate Speak",
      "region": "Arr, the Seven Seas",
      "bidirectional": false
    }
  }
  ```

## Pack Format Version Reference

### Data Packs
| Minecraft Version | Pack Format |
|-------------------|-------------|
| 1.21.9+ | 88 |
| 1.21.5 | 84 |
| 1.21.4 | 61 |
| 1.21.2-1.21.3 | 57 |
| 1.21-1.21.1 | 48 |
| 1.20.5-1.20.6 | 41 |
| 1.20.3-1.20.4 | 26 |
| 1.20.2 | 18 |
| 1.20-1.20.1 | 15 |
| 1.19.4 | 12 |
| 1.19-1.19.3 | 10 |

### Resource Packs
| Minecraft Version | Pack Format |
|-------------------|-------------|
| 1.21.9+ | 69 |
| 1.21.7-1.21.8 | 64 |
| 1.21.6 | 63 |
| 1.21.5 | 55 |
| 1.21.4 | 46 |
| 1.21.2-1.21.3 | 42 |
| 1.21-1.21.1 | 34 |
| 1.20.5-1.20.6 | 32 |
| 1.20.3-1.20.4 | 22 |
| 1.20.2 | 18 |
| 1.20-1.20.1 | 15 |

## Examples

### Modern Format (1.21.9+)
```json
{
  "pack": {
    "description": "My Datapack for 1.21.9",
    "min_format": [88, 0],
    "max_format": [88, 0]
  }
}
```

### Legacy Format (Pre-1.21.9)
```json
{
  "pack": {
    "pack_format": 48,
    "description": "My Datapack for 1.21"
  }
}
```

### Multi-Version Support
```json
{
  "pack": {
    "description": "Works on 1.21 through 1.21.9",
    "min_format": 48,
    "max_format": 88
  }
}
```

### With Overlays for Different Versions
```json
{
  "pack": {
    "description": "Multi-version pack with overlays",
    "min_format": 48,
    "max_format": 88
  },
  "overlays": {
    "entries": [
      {
        "formats": {"min_inclusive": 48, "max_inclusive": 60},
        "directory": "old_version"
      },
      {
        "formats": {"min_inclusive": 61, "max_inclusive": 88},
        "directory": "new_version"
      }
    ]
  }
}
```

### With Custom Language (Resource Pack)
```json
{
  "pack": {
    "pack_format": 34,
    "description": "Resource pack with custom language"
  },
  "language": {
    "lol_us": {
      "name": "LOLCAT",
      "region": "United States",
      "bidirectional": false
    }
  }
}
```

### With Experimental Features
```json
{
  "pack": {
    "pack_format": 48,
    "description": "Pack with experimental features"
  },
  "features": {
    "enabled": [
      "minecraft:trade_rebalance"
    ]
  }
}
```

## Important Notes

1. **Modern vs Legacy:** As of Minecraft 1.21.9 (snapshot 25w31a), use `min_format` and `max_format` instead of `pack_format`
2. **Minor Versions:** Format `[major, minor]` where `[88, 0]` is equivalent to just `88`
3. **Description:** Can be a simple string or a JSON text component with formatting
4. **Overlays:** Directory names can only use: a-z, 0-9, underscore, and hyphen
5. **File Naming:** All files should use lowercase (pack_format 3+)
6. **Backwards Compatibility:** Include deprecated fields when supporting older versions

## Validation

Your pack.mcmeta file must:
- Be valid JSON (no trailing commas, proper quotes)
- Include at least `pack` and `description`
- Include either `pack_format` OR both `min_format` and `max_format`
- Be named exactly `pack.mcmeta` (lowercase)
- Be in the root directory of your pack
