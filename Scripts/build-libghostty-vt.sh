#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
G="${GHOSTTY_DIR:-"$ROOT/ghostty"}"
[[ -f "$G/build.zig" ]] || { echo "missing $G (clone ghostty-org/ghostty there)" >&2; exit 1; }
(cd "$G" && zig build lib-vt -Demit-macos-app=false "$@")
mkdir -p "$ROOT/CLibGhosttyVt/lib"
cp -P "$G/zig-out/lib/libghostty-vt"* "$ROOT/CLibGhosttyVt/lib/"
mkdir -p "$ROOT/CLibGhosttyVt/include/ghostty"
rsync -a --delete "$G/include/ghostty/" "$ROOT/CLibGhosttyVt/include/ghostty/"
