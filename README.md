# Textsicher Models

AI models for the [Textsicher](https://github.com/your-org/Textsicher) app — TTS (text-to-speech) and STT (speech-to-text).

## Structure

```
tts/piper/          ← Piper TTS models (.onnx + .onnx.json)
stt/sherpa-onnx/    ← Sherpa-ONNX STT models
```

## TTS Models (Piper)

| Model | Language | Quality |
|---|---|---|
| de_DE-thorsten-low | German | low |
| de_DE-kerstin-low | German | low |
| en_US-ryan-low | English (US) | low |
| en_US-amy-low | English (US) | low |
| es_ES-sharvard-medium | Spanish (ES) | medium (2 speakers) |
| fr_FR-gilles-low | French | low |
| fr_FR-siwis-low | French | low |

Each model ships with a `.onnx.json` config file required by Piper.

## STT Models (Sherpa-ONNX / Kroko)

| Model | Language |
|---|---|
| de-kroko-2025-08-06 | German |
| en-kroko-2025-08-06 | English |
| es-kroko-2025-08-06 | Spanish |
| fr-kroko-2025-08-06 | French |

Each model contains `encoder.onnx`, `decoder.onnx`, `joiner.onnx`, `tokens.txt`.

## Usage

### Piper TTS Container

Models are baked into the container at build time from this repo.

### Flutter App (STT)

The app downloads the required STT model on first launch and caches it locally.
