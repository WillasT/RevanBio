//
//  AnswerQuiz.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 13/05/25.
//

import SwiftUI
import AVFoundation

struct AnswerQuiz: View {
    let text: String
    let isSelected: Bool
    let isMatched: Bool
    var disableAll: Bool = false
    //    let isWrong: Bool
    let wrongAttempts: Int
    var onTap: () -> Void
    
    @State private var lastWrongAttempts: Int = 0
    @State private var showWrong: Bool = false
    @State private var showMatch: Bool = false
    @State private var matchedOnce: Bool = false
    @State private var settledMatched: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(maxWidth: 160, maxHeight: 70)
                .foregroundColor(
                    showMatch ? .green.opacity(0.7) :
                        settledMatched ? Color("main").opacity(0.3) :
                        showWrong ? .red.opacity(0.4) :
                        isSelected ? Color("main").opacity(0.7) :
                        Color("main")
                )
                .animation(.easeInOut(duration: 0.3), value: showWrong)
                .animation(.easeInOut(duration: 0.3), value: showMatch)
                .animation(.easeInOut(duration: 0.3), value: settledMatched)

            Button(
                action: {
                    onTap()
                }
            ) {
                Text(text)
                    .foregroundColor(
                        settledMatched ? .primary.opacity(0.3) :
                        isMatched ? .primary :
                            disableAll ? .primary.opacity(0.4) :
                            isSelected ? .primary.opacity(0.7) :
                                .primary
                    )
                    .frame(maxWidth: 155, maxHeight: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                disableAll ? Color(.systemBackground) :
                                    isSelected ? Color(.systemBackground) .opacity(0.7) :
                                        Color(.systemBackground) 
                            )
                    )
                    .multilineTextAlignment(.center)
            }
            .disabled(isMatched || disableAll)
            .buttonStyle(ButtonPressedStyle())
        }
        .onChange(of: wrongAttempts) {
            guard wrongAttempts > lastWrongAttempts else { return }
            lastWrongAttempts = wrongAttempts
            playIncorrectSound()
            showWrong = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    showWrong = false
                }
            }
        }
        .onChange(of: isMatched) {
            guard isMatched && !matchedOnce else { return }
            matchedOnce = true
            playCorrectSound()
            showMatch = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    showMatch = false
                    settledMatched = true
                }
            }
        }
    }
    
    func playCorrectSound() {
        guard let url = Bundle.main.url(forResource: "correct_new", withExtension: "m4a") else {
            print("Sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
    
    func playIncorrectSound() {
        guard let url = Bundle.main.url(forResource: "incorrect_new", withExtension: "m4a") else {
            print("Sound file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
    }
}


struct ButtonPressedStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .offset(y: configuration.isPressed ? 0 : -2)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        
    }
}
