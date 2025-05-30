//
//  PlayButton.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI

struct PlayButton : View {
    
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            HStack(spacing: 8){
                Image(systemName: "play.fill")
                Text("Play")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(DarkenOnPressButtonStyle())
        .shadow(radius: 8)

    }
}

struct DarkenOnPressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
            .background(configuration.isPressed ? Color.blue.opacity(0.6) : Color("main"))
            .foregroundColor(configuration.isPressed ? Color.primary.opacity(0.6) : Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.05), value: configuration.isPressed)
    }
}


#Preview {
    PlayButton {
        print(">>> Button Tapped <<<")
    }
}
