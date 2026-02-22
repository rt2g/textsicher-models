# TTS — Piper Models

Compatible with any [Piper TTS](https://github.com/rhasspy/piper) VITS model from
[rhasspy/piper-voices](https://huggingface.co/rhasspy/piper-voices).

## Folder naming

Each voice gets its own folder named exactly as the model file:

```
{locale}-{voice}-{quality}/
└── {locale}-{voice}-{quality}.onnx
└── {locale}-{voice}-{quality}.onnx.json   ← required by Piper
```

Example:
```
de_DE-thorsten-low/
├── de_DE-thorsten-low.onnx
└── de_DE-thorsten-low.onnx.json
```

## Release asset naming

The `release.sh` script converts folder names to asset names automatically:

```
{locale}-{voice}-{quality}  →  tts_piper_{lang}_{voice}_{quality}.tar.gz
```

Example: `de_DE-thorsten-low` → `tts_piper_de_de_thorsten_low.tar.gz`

The folder name is lowercased and all non-alphanumeric characters replaced with `_`.

## Adding a new voice

1. Download `.onnx` and `.onnx.json` from HuggingFace
2. Create a folder with the correct name
3. Place both files inside
4. Run `release.sh` with a new version tag

## Current voices

| Folder | Language | Quality |
|---|---|---|
| de_DE-thorsten-low | German | low |
| de_DE-kerstin-low | German | low |
| en_US-joe-medium | English (US) | medium |
| en_US-amy-low | English (US) | low |
| es_ES-sharvard-medium | Spanish (ES) | medium (2 speakers) |
| fr_FR-gilles-low | French | low |
| fr_FR-siwis-low | French | low |
