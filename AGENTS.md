# manima

macOS 13+ / SwiftUI。Swift ソースは **`macos/`** のみ。

`ghostty/` で `zig build lib-vt` し、次を実行してから `swift build` する。

```bash
./Scripts/build-libghostty-vt.sh   # CLibGhosttyVt/lib と include/ghostty/ を生成
swift run manima
```

要件: Xcode（Swift 5.9+）、Zig 0.15.x、リポジトリ直下の Ghostty ソース `ghostty/`。
