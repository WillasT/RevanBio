//
//  MusicPlayer.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 19/05/25.
//

import SwiftUI

struct MusicPlayer: View {
    @StateObject private var audioPlayer = AudioPlayerViewModel()
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                .opacity(0.1)
                .shadow(radius: 4)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            HStack {
                Image("artgalleryimg")
                    .resizable()
                    .frame(width: 96, height: 96)
                VStack(alignment: .leading){
                    Text("An Art Gallery Could Never Be As Unique As You")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text("mrld")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                Spacer(minLength: 12)
                Button(action: {
                    audioPlayer.togglePlayback()
                }) {
                    Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(12)
                        .background(Color("main"))
                        .clipShape(Circle())
                        .padding()
                }
                .foregroundColor(.primary)
                .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(8)
        }
    }
}

#Preview {
    MusicPlayer()
}
