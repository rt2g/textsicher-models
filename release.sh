#!/usr/bin/env bash
# Creates a GitHub release and uploads all TTS and STT models as assets.
#
# Usage:
#   ./release.sh v1.0.0
#   ./release.sh v1.1.0 "Optional release notes"

set -euo pipefail

VERSION="${1:-}"
NOTES="${2:-}"
REPO="rt2g/textsicher-models"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version> [notes]"
  echo "Example: $0 v1.0.0"
  exit 1
fi

if ! command -v gh &>/dev/null; then
  echo "Error: gh CLI not found. Install from https://cli.github.com"
  exit 1
fi

echo "=== Building release $VERSION ==="
ASSETS=()

# --- TTS: tts/piper/{locale}-{voice}-{quality}/ ---
for dir in "$SCRIPT_DIR/tts/piper"/*/; do
  [[ -d "$dir" ]] || continue
  folder=$(basename "$dir")

  # Extract language from locale prefix (e.g. de_DE-thorsten-low → de)
  locale="${folder%%-*}"           # de_DE
  lang="${locale%%_*}"             # de
  rest="${folder#*-}"              # thorsten-low
  rest_underscored="${rest//-/_}"  # thorsten_low

  asset_name="tts_piper_${lang}_${rest_underscored}.tar.gz"
  archive="$TMP_DIR/$asset_name"

  echo "  Packing $folder → $asset_name"
  tar -czf "$archive" -C "$SCRIPT_DIR/tts/piper" "$folder"
  ASSETS+=("$archive")
done

# --- STT: stt/sherpa-onnx/{lang}-{model}-{date}/ ---
for dir in "$SCRIPT_DIR/stt/sherpa-onnx"/*/; do
  [[ -d "$dir" ]] || continue
  folder=$(basename "$dir")

  # e.g. de-kroko-2025-08-06 → stt_sherpa_de_kroko_2025_08_06
  folder_underscored="${folder//-/_}"
  asset_name="stt_sherpa_${folder_underscored}.tar.gz"
  archive="$TMP_DIR/$asset_name"

  echo "  Packing $folder → $asset_name"
  tar -czf "$archive" -C "$SCRIPT_DIR/stt/sherpa-onnx" "$folder"
  ASSETS+=("$archive")
done

echo ""
echo "=== Creating GitHub release $VERSION ==="
gh release create "$VERSION" \
  --repo "$REPO" \
  --title "$VERSION" \
  ${NOTES:+--notes "$NOTES"} \
  "${ASSETS[@]}"

echo ""
echo "Done: https://github.com/$REPO/releases/tag/$VERSION"
