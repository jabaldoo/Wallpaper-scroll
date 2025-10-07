
import AppKit
import SwiftUI

class WallpaperManager: ObservableObject {
    @Published var wallpapers: [URL] = []
    private var wallpaperFolder: URL?

    init() {
        let picturesDirectory = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask).first
        wallpaperFolder = picturesDirectory?.appendingPathComponent("Wallpapers")
        createWallpaperFolderIfNeeded()
        loadWallpapers()
    }

    private func createWallpaperFolderIfNeeded() {
        guard let wallpaperFolder = wallpaperFolder else { return }
        if !FileManager.default.fileExists(atPath: wallpaperFolder.path) {
            try? FileManager.default.createDirectory(at: wallpaperFolder, withIntermediateDirectories: true, attributes: nil)
        }
    }

    func loadWallpapers() {
        guard let wallpaperFolder = wallpaperFolder else { return }
        let fileManager = FileManager.default
        let imageExtensions = ["jpg", "jpeg", "png", "heic"]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: wallpaperFolder, includingPropertiesForKeys: nil)
            self.wallpapers = fileURLs.filter { imageExtensions.contains($0.pathExtension.lowercased()) }
        } catch {
            print("Error loading wallpapers: \(error)")
        }
    }

    func setWallpaper(at url: URL) {
        do {
            if let screen = NSScreen.main {
                try NSWorkspace.shared.setDesktopImageURL(url, for: screen, options: [:])
            }
        } catch {
            print("Error setting wallpaper: \(error)")
        }
    }

    func setRandomWallpaper() {
        if !wallpapers.isEmpty {
            let randomWallpaper = wallpapers.randomElement()!
            setWallpaper(at: randomWallpaper)
        }
    }
}
