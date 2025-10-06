
import SwiftUI

@main
struct WallpaperScrollApp: App {
    @StateObject private var wallpaperManager = WallpaperManager()

    var body: some Scene {
        MenuBarExtra {
            ContentView(wallpaperManager: wallpaperManager)
        } label: {
            Image(systemName: "photo.on.rectangle.angled")
        }
    }
}
