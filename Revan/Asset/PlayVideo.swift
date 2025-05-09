//
//  PlayVideo.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI
import AVKit

struct PlayVideo: View {
    var body: some View {
        if let url = Bundle.main.url(forResource: "Hackfest", withExtension: "mp4") {
            
            let player = AVPlayer(url: url)
            VideoPlayer(player: player)
                .onAppear(){
//                    player.play()
                }.frame(maxWidth: .infinity)
                .aspectRatio(16/9, contentMode: .fit)
                .shadow(color: .gray, radius: 5)
        }else{
            Text("Video Not Found")
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    PlayVideo()
}
