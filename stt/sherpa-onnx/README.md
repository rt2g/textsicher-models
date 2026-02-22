# STT — Sherpa-ONNX Models

Compatible with [Sherpa-ONNX](https://github.com/k2-fsa/sherpa-onnx) streaming
zipformer models. Currently using the
[Kroko-ASR](https://huggingface.co/Banafo/Kroko-ASR) models (CC BY-SA 4.0).

## Folder naming

```
{lang}-{model}-{date}/
├── encoder.onnx   ← required
├── decoder.onnx   ← required
├── joiner.onnx    ← required
└── tokens.txt     ← required
```

Example:
```
de-kroko-2025-08-06/
├── encoder.onnx
├── decoder.onnx
├── joiner.onnx
└── tokens.txt
```

## Release asset naming

The `release.sh` script converts folder names to asset names automatically:

```
{lang}-{model}-{date}  →  stt_sherpa_{lang}_{model}_{date}.tar.gz
```

Example: `de-kroko-2025-08-06` → `stt_sherpa_de_kroko_2025_08_06.tar.gz`

## Adding a new model

1. Download the model folder from HuggingFace / Sherpa-ONNX releases
2. Keep only the 4 required files (remove test_wavs, README etc.)
3. Name the folder `{lang}-{model}-{date}`
4. Run `release.sh` with a new version tag

## Current models

| Folder | Language |
|---|---|
| de-kroko-2025-08-06 | German |
| en-kroko-2025-08-06 | English |
| es-kroko-2025-08-06 | Spanish |
| fr-kroko-2025-08-06 | French |
