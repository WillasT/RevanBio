//
//  PlayVideo.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI
import AVKit

struct PlayVideo: View {
    private let player: AVQueuePlayer
    private let looper: AVPlayerLooper?
    
    init(){
        if let url = Bundle.main.url(forResource: "GainB", withExtension: "mp4") {
            let asset = AVURLAsset(url: url)
            let item = AVPlayerItem(asset: asset)
            let queuePlayer = AVQueuePlayer()
            self.looper = AVPlayerLooper(player: queuePlayer, templateItem: item)
            self.player = queuePlayer
        }else{
            self.player = AVQueuePlayer()
            self.looper = nil
        }
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear(){
                player.play()
            }.frame(maxWidth: .infinity)
            .aspectRatio(16/9, contentMode: .fit)
            .shadow(color: .gray, radius: 5)
    }
}

#Preview {
    PlayVideo()
}
