// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "WallpaperScroll",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "WallpaperScroll", targets: ["WallpaperScroll"])
    ],
    targets: [
        .executableTarget(
            name: "WallpaperScroll",
            path: "Sources/WallpaperScroll",
            linkerSettings: [
                .unsafeFlags([
                    "-Xlinker", "-sectcreate",
                    "-Xlinker", "__TEXT",
                    "-Xlinker", "__info_plist",
                    "-Xlinker", "Sources/WallpaperScroll/Info.plist"
                ])
            ]
        )
    ]
)
