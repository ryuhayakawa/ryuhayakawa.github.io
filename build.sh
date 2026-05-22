#!/bin/bash
# Build script: sync index.html/photo.jpg to docs/ and render Quarto notes

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"

# 1. docs/ を準備
mkdir -p "$ROOT/docs"

# 2. メインページのファイルを docs/ にコピー
cp "$ROOT/index.html" "$ROOT/docs/index.html"
cp "$ROOT/photo.jpg"  "$ROOT/docs/photo.jpg"
cp -r "$ROOT/slides" "$ROOT/docs/slides"

# 3. Quarto で notes をビルド（docs/notes/ に出力）
cd "$ROOT/notes"
quarto render

echo "Build complete. docs/ is ready to push."
