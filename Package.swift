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
            path: ".",
            sources: ["WallpaperScrollApp.swift", "WallpaperManager.swift", "ContentView.swift"]
        )
    ]
)
