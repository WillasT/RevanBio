//
//  Games.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 10/05/25.
//

import SwiftUI

struct Games: View {
    
    let games: [Game] = [
        Game(name: "GTA V Legacy", imageName: "gtav", description: "Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.", hoursPlayed: "64.2 hours")
    ]
    
    var body: some View {
        ForEach (games){ game in
            ZStack{
                Image(systemName: "rectangle.fill")
                    .resizable()
                    .frame(width: .infinity, height: 120)
                    .opacity(0.1)
                    .shadow(radius: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                HStack{
                    Image(game.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading){
                        Text(game.name)
                            .font(.headline)
                        Text(game.hoursPlayed)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Games()
}
