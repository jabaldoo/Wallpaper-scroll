
import SwiftUI

@main
struct WallpaperScrollApp: App {
    @StateObject private var wallpaperManager = WallpaperManager()

    init() {
        print("Application starting...")
    }

    var body: some Scene {
        MenuBarExtra {
            ContentView(wallpaperManager: wallpaperManager)
        } label: {
            Image(systemName: "photo.on.rectangle.angled")
        }
    }
}
