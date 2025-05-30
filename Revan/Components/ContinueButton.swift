//
//  Continue.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 13/05/25.
//

import SwiftUI

struct ContinueButton: View{
    var isActive: Bool
    var isWrong: Bool
    var correctAnswerPair: (String, String)?
    
    var onTap: () -> Void
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            VStack (spacing: 8){
                if isWrong, let correctAnswerPair = correctAnswerPair {
                    HStack{
                        VStack(alignment: .leading, spacing: 4){
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text("Incorrect")
                                    .font(.headline)
                                    .foregroundColor(.red)
                            }
                            
                            Text("Correct Answer: \(correctAnswerPair.0) - \(correctAnswerPair.1)")
                                .foregroundColor(.red)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.horizontal)
                        .transition(.opacity)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .opacity(showAlert ? 1 : 0)
                } else {
                    Spacer(minLength: 0)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: 360, maxHeight: 70)
                        .foregroundStyle(
                            
                            !isActive
                            ? Color("main").opacity(0.7)
                            : (isWrong
                               ? Color.red.opacity(0.6)
                               : Color("main"))
                        )
                    
                    Button(action: onTap) {
                        Text("Continue")
                            .foregroundColor(!isActive ? .primary.opacity(0.5):.primary)
                            .frame(maxWidth: 355, maxHeight: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        Color(.systemBackground) 
                                    )
                                
                            )
                    }
                    .disabled(!isActive)
                    .buttonStyle(ButtonPressedStyle())
                }
            }
            .padding(.top, 10)
            .frame(height: 130)
            .animation(.easeInOut(duration: 0.25), value: isWrong)
        }
        .background(showAlert ? .red.opacity(0.2) : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onChange(of: isWrong) {
            if isWrong {
                showAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.easeOut(duration: 1.0)) {
                        showAlert = false
                    }
                }
            } else {
                showAlert = false
            }
        }
    }
}
#Preview {
    ContinueButton(isActive: false, isWrong: false, onTap: {})
}
