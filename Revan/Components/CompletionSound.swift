//
//  CompletionSound.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 19/05/25.
//

import AVFoundation

class CompletionSound {
    static let shared = CompletionSound()
    private var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "completed_new", withExtension: "m4a") else {
            print("Sound file completed not found.")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
    
}
