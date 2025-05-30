//
//  AudioPlayerViewModel.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 19/05/25.
//

import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var player: AVAudioPlayer?
    @Published var isPlaying = false
    
    init(){
        setupAudio()
    }
    
    private func setupAudio(){
        guard let url = Bundle.main.url(forResource: "art_gallery", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
        } catch {
            print("Error loading up audio player: \(error)")
        }
    }
    
    func togglePlayback(){
        guard let player = player else {
            print("Player not initialized")
            return
        }
        
        if isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
}
