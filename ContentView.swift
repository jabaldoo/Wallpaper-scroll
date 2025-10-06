
import SwiftUI

struct ContentView: View {
    @ObservedObject var wallpaperManager: WallpaperManager

    var body: some View {
        VStack {
            Button("Set Random Wallpaper") {
                wallpaperManager.setRandomWallpaper()
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(wallpaperManager.wallpapers, id: \.self) { wallpaperURL in
                        Button(action: {
                            wallpaperManager.setWallpaper(at: wallpaperURL)
                        }) {
                            HStack {
                                Image(nsImage: NSImage(contentsOf: wallpaperURL) ?? NSImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipped()
                                    .cornerRadius(5)
                                Text(wallpaperURL.lastPathComponent)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .frame(width: 300, height: 400)
        .onAppear {
            wallpaperManager.loadWallpapers()
        }
    }
}
