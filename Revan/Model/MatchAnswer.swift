//
//  MatchAnswer.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 18/05/25.
//

import Foundation

struct MatchAnswer: Identifiable {
    let id = UUID()
    let text: String
    let pairID: UUID
    var isMatched: Bool = false
    var isWrong: Bool = false
}
