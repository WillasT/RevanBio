//
//  QuizView.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI

struct QuizView : View {
    
    @State private var progress = 0.0
    @State private var showAlert = false
    @State private var showCompletionAlert = false
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuizViewModel()
    
    private let spacingStack: CGFloat = 24
    private var answerGrid: some View {
        HStack {
            VStack(spacing: 16) {
                ForEach(viewModel.leftItems) { item in
                    AnswerQuiz(
                        text: item.text,
                        isSelected: viewModel.selectedLeftID == item.id,
                        isMatched: item.isMatched,
                        wrongAttempts: viewModel.leftAttempts[item.id] ?? 0,
                        onTap: { viewModel.selectLeft(item.id) }
                    )
                }
            }
            
            Spacer(minLength: 40)
            
            VStack(spacing: 16) {
                ForEach(viewModel.rightItems) { item in
                    AnswerQuiz(
                        text: item.text,
                        isSelected: viewModel.selectedRightID == item.id,
                        isMatched: item.isMatched,
                        wrongAttempts: viewModel.rightAttempts[item.id] ?? 0,
                        onTap: { viewModel.selectRight(item.id) }
                    )
                }
            }
        }
        
    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                Text("Tap The Matching Pairs For Revan")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                answerGrid
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    .animation(.easeInOut(duration: 0.4), value: viewModel.currentRoundIndex)
                
                
                Spacer()
                
                ContinueButton(
                    isActive: viewModel.continueActive,
                    isWrong: viewModel.continueWrong,
                    correctAnswerPair: viewModel.lastCorrectPair
                ) {
                    if viewModel.currentRoundIndex >= 2 {
                        progress += 0.34
                        CompletionSound.shared.playSound()
                        showCompletionAlert = true
                    } else {
                        withAnimation {
                            progress += 0.33
                            viewModel.resetQuizState()
                        }
                    }
                }
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
        .toolbar {
            ToolbarItem{
                ProgressView(value: progress)
                    .frame(width: 320)
                    .padding(.horizontal)
                    .tint(Color("main"))
                
            }
        }
        .alert("Quiz Completed!", isPresented: $showCompletionAlert) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("You’ve now know Revan well!")
        }
        
    }
}

#Preview {
    QuizView()
}
