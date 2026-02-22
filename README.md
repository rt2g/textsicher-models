# Textsicher Models

AI models for the [Textsicher](https://github.com/rt2g/Textsicher) app — TTS (text-to-speech) and STT (speech-to-text).

Models are distributed as GitHub Release assets, not tracked in git.

## TTS Models (Piper)

| Asset | Language | Quality |
|---|---|---|
| tts_piper_de_thorsten_low.tar.gz | German | low |
| tts_piper_de_kerstin_low.tar.gz | German | low |
| tts_piper_en_joe_medium.tar.gz | English (US) | medium |
| tts_piper_en_amy_low.tar.gz | English (US) | low |
| tts_piper_es_sharvard_medium.tar.gz | Spanish (ES) | medium (2 speakers) |
| tts_piper_fr_gilles_low.tar.gz | French | low |
| tts_piper_fr_siwis_low.tar.gz | French | low |

Each model ships with a `.onnx.json` config file required by Piper.
For `tts_piper_es_sharvard_medium`, speaker 0 is male and speaker 1 is female.

## STT Models (Sherpa-ONNX / Kroko)

| Asset | Language |
|---|---|
| stt_sherpa_de_kroko_2025_08_06.tar.gz | German |
| stt_sherpa_en_kroko_2025_08_06.tar.gz | English |
| stt_sherpa_es_kroko_2025_08_06.tar.gz | Spanish |
| stt_sherpa_fr_kroko_2025_08_06.tar.gz | French |

Each model contains `encoder.onnx`, `decoder.onnx`, `joiner.onnx`, `tokens.txt`.

## Credits

| Model | Source | License |
|---|---|---|
| thorsten | [Thorsten Voice](https://github.com/thorstenMueller/Thorsten-Voice) | CC0 |
| kerstin | [rhasspy/dataset-voice-kerstin](https://github.com/rhasspy/dataset-voice-kerstin) | CC0 |
| joe | [OHF-Voice/voice-datasets](https://github.com/OHF-Voice/voice-datasets) | CC0 |
| amy | [MycroftAI/mimic3-voices](https://github.com/MycroftAI/mimic3-voices) | CC BY-SA 4.0 |
| sharvard | [Edinburgh DataShare](https://datashare.ed.ac.uk/handle/10283/574) | CC BY 3.0 |
| gilles | [Kaggle French Dataset](https://www.kaggle.com/datasets/bryanpark/french-single-speaker-speech-dataset) | CC0 |
| siwis | [SIWIS Dataset](https://datashare.is.ed.ac.uk/handle/10283/2353) | CC BY 4.0 |
| kroko (all languages) | [Banafo/Kroko-ASR](https://huggingface.co/Banafo/Kroko-ASR) | CC BY-SA 4.0 |
