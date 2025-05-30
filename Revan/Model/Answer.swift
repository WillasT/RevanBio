//
//  Answer.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 13/05/25.
//

import Foundation

struct Answer: Identifiable {
    let id = UUID()
    let text: String
//    let isCorrect: Bool
    
    var pairID: UUID? = nil
    var isSelected: Bool = false
    var isDisabled: Bool = false
    var isWrong: Bool = false
    
    init(text: String, pairID: UUID? = nil){
        self.text = text
        self.pairID = pairID
    }
}
