//
//  Games.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 10/05/25.
//

import SwiftUI

struct Games: View {
    
    let games: [Game] = [
        Game(name: "Counter-Strike 2", imageName: "cs2", description: "For over two decades, Counter-Strike has offered an elite competitive experience, one shaped by millions of players from across the globe. And now the next chapter in the CS story is about to begin. This is Counter-Strike 2.", hoursPlayed: "2,453.1 hours"),
        Game(name: "Apex Legends", imageName: "apex", description: "Apex Legends is the award-winning, free-to-play Hero Shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities, and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.", hoursPlayed: "533 hours"),
        Game(name: "PUBG: BATTLEGROUNDS", imageName: "pubg", description: "PUBG: BATTLEGROUNDS, the high-stakes winner-take-all shooter that started the Battle Royale craze, is free-to-play! Drop into diverse maps, loot unique weapons and supplies, and survive in an ever-shrinking zone where every turn could be your last.", hoursPlayed: "225.6 hours"),
        Game(name: "VEGAS Pro 14", imageName: "vegaspro", description: "VEGAS Pro 14 Edit – Steam Edition provides powerful functionality and advanced features for top-end professional video and audio editing.", hoursPlayed: "84.2 hours"),
        Game(name: "Grand Theft Auto V Legacy", imageName: "gtav", description: "Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.", hoursPlayed: "64.2 hours")
    ]
    
    var body: some View {
        ForEach (games){ game in
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                    .opacity(0.1)
                    .shadow(radius: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                HStack{
                    Image(game.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading){
                        Text(game.name)
                            .font(.headline)
                        Text(game.hoursPlayed)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 1)
                        Text(game.description)
                            .font(.caption2)
                            .lineLimit(2)
                    }
                    Spacer()
                    Text("PC")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("main").opacity(0.3))
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
            .padding(.vertical, 2)
        }
    }
}

#Preview {
    Games()
}
