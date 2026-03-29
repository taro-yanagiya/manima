import CLibGhosttyVt
import SwiftUI

struct ContentView: View {
    @State private var ghosttyStatus: String = "libghostty-vt を初期化しています…"

    var body: some View {
        VStack(spacing: 12) {
            Text("manima")
                .font(.largeTitle)
            Text(ghosttyStatus)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(minWidth: 400, minHeight: 300)
        .task {
            do {
                let term = try VtTerminal()
                ghosttyStatus = term.isAlive
                    ? "libghostty-vt: 端末ハンドルを作成しました（80×24 セル）"
                    : "libghostty-vt: 予期しない状態です"
            } catch {
                ghosttyStatus = "libghostty-vt の初期化に失敗: \(error.localizedDescription)"
            }
        }
    }
}

private enum VtError: Error, LocalizedError {
    case newFailed(GhosttyResult)
    var errorDescription: String? {
        if case .newFailed(let c) = self { return "ghostty_terminal_new が失敗 (コード \(c.rawValue))" }
        return nil
    }
}

private final class VtTerminal {
    private var handle: GhosttyTerminal?
    init() throws {
        var terminal: GhosttyTerminal?
        let options = GhosttyTerminalOptions(cols: 80, rows: 24, max_scrollback: 10_000)
        let result = ghostty_terminal_new(nil, &terminal, options)
        guard result == GHOSTTY_SUCCESS, let t = terminal else { throw VtError.newFailed(result) }
        handle = t
    }
    deinit { if let handle { ghostty_terminal_free(handle) } }
    var isAlive: Bool { handle != nil }
}
