//
//  HD.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI


struct HD: View {
    var rating: String = "HD"
    
    var body: some View {
        ZStack {
            // Background: rounded rectangle SF Symbol
            Image(systemName: "rectangle")
                .resizable()
                .frame(width: 30, height: 24)
                .foregroundColor(.gray.opacity(0.9))
            
            // Foreground: HD Text
            Text("HD")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray.opacity(0.7))
        }
    }
}

#Preview {
    HD()
}
