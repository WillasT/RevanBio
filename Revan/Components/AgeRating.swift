//
//  AgeRating.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 08/05/25.
//

import SwiftUI


struct AgeRating: View {
    var rating: String = "21+"
    
    var body: some View {
        Text(rating)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
            .background(Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    AgeRating()
}
