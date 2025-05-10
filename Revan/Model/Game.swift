//
//  Game.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 10/05/25.
//

import Foundation

struct Game: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let hoursPlayed: String
}
