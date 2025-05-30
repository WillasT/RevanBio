//
//  ShowAlert.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 17/05/25.
//

import SwiftUI

struct ShowAlert: View {
    
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        Color.black.opacity(0.5)
            .ignoresSafeArea()
        VStack(spacing: 12){
            HStack{
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.red.opacity(0.7))
                Text("Incorrect")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red.opacity(0.7))
            }
//            Text("Correct Answer: \(viewModel.lastCorrectPair.joined(separator: "&"))")
//                .foregroundStyle(.red.opacity(0.7))
//                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ShowAlert()
}
