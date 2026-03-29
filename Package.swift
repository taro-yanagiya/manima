// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "manima",
    platforms: [
        .macOS(.v13)
    ],
    targets: [
        .target(
            name: "CLibGhosttyVt",
            path: "CLibGhosttyVt",
            sources: ["stub.c"],
            publicHeadersPath: "include",
            linkerSettings: [
                .unsafeFlags(
                    [
                        "-LCLibGhosttyVt/lib",
                        "-lghostty-vt",
                        "-Xlinker", "-rpath", "-Xlinker",
                        "@executable_path/../../../CLibGhosttyVt/lib"
                    ],
                    .when(platforms: [.macOS])
                )
            ]
        ),
        .executableTarget(
            name: "manima",
            dependencies: ["CLibGhosttyVt"],
            path: "macos"
        )
    ]
)
