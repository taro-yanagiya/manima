# manima

A minimal macOS SwiftUI desktop application (Swift 5.9+, macOS 13+).

## Cursor Cloud specific instructions

### Platform limitation

This is a **macOS-only** SwiftUI application. The `SwiftUI` framework is not available on Linux, so `swift build` and `swift run` will fail on Cloud Agent VMs with `error: no such module 'SwiftUI'`. This is expected and not a code defect.

### What works on Linux

| Command | Purpose |
|---|---|
| `swift package dump-package` | Validate `Package.swift` manifest |
| `swift package resolve` | Resolve dependencies (currently none) |
| `swiftlint lint` | Lint all Swift source files |

### Linting

Run `swiftlint lint` from the repo root. SwiftLint is pre-installed in the VM at `/usr/local/bin/swiftlint`.

### Building and running (macOS only)

- `swift build` — compile the app
- `swift run manima` — launch the app
- Alternatively, open `Package.swift` in Xcode and run from there.

### Tests

No automated tests exist in this project yet. When tests are added, run them with `swift test`.
