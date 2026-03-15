// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "manima",
    platforms: [
        .macOS(.v13)
    ],
    targets: [
        .executableTarget(
            name: "manima",
            path: "manima"
        )
    ]
)
