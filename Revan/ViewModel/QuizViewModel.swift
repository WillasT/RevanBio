//
//  QuizViewModel.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 13/05/25.
//

import Foundation

class QuizViewModel: ObservableObject {
    
    struct MatchingRound {
        let pairs: [(String, String)]
    }
    
    private var rounds: [MatchingRound] = []
    @Published var leftItems: [MatchAnswer] = []
    @Published var rightItems: [MatchAnswer] = []
    @Published var selectedLeftID: UUID? = nil
    @Published var selectedRightID: UUID? = nil
    @Published var continueActive = false
    @Published var continueWrong = false
    @Published var lastCorrectPair: (String, String)? = nil
    @Published var rightAttempts: [UUID: Int] = [:]
    @Published var leftAttempts: [UUID: Int] = [:]
    
    var currentRoundIndex = 0
    
    init() {
        setupRounds()
        loadMatchingQuiz()
    }
    
    private func setupRounds() {
        rounds = [
            MatchingRound(pairs: [
                ("TypeScript", "34 Projects"),
                ("Swift", "2 Projects"),
                ("Rust", "1 Project")
            ]),
            MatchingRound(pairs: [
                ("Counter-Strike 2", "2453.1 Hours"),
                ("GTA V Legacy", "64.2 Hours"),
                ("Apex Legends", "533 Hours")
            ]),
            MatchingRound(pairs: [
                ("JavaScript", "8 Projects"),
                ("PHP", "2 Projects"),
                ("Astro", "1 Project")
            ])
        ]
    }
    
    func loadMatchingQuiz() {
        guard currentRoundIndex < rounds.count else { return }
        
        let pairs = rounds[currentRoundIndex].pairs
        var left: [MatchAnswer] = []
        var right: [MatchAnswer] = []
        
        for (leftText, rightText) in pairs {
            let pairID = UUID()
            left.append(MatchAnswer(text: leftText, pairID: pairID))
            right.append(MatchAnswer(text: rightText, pairID: pairID))
        }
        
        self.leftItems = left
        self.rightItems = right.shuffled()
        self.selectedLeftID = nil
        self.continueActive = false
    }
    
    func selectLeft(_ id: UUID) {
        if let rightID = selectedRightID,
           let leftIndex = leftItems.firstIndex(where: { $0.id == id }),
           let rightIndex = rightItems.firstIndex(where: { $0.id == rightID }) {
            checkPair(leftIndex: leftIndex, rightIndex: rightIndex)
            selectedRightID = nil
        } else {
            selectedLeftID = id
        }
    }
    
    
    func selectRight(_ id: UUID) {
        if let leftID = selectedLeftID,
           let leftIndex = leftItems.firstIndex(where: { $0.id == leftID }),
           let rightIndex = rightItems.firstIndex(where: { $0.id == id }) {
            checkPair(leftIndex: leftIndex, rightIndex: rightIndex)
            selectedLeftID = nil
        } else {
            selectedRightID = id
        }
    }

    
    func resetQuizState() {
        currentRoundIndex += 1
        loadMatchingQuiz()
    }
    
    private func getCorrectPair(for pairID: UUID) -> (String, String)? {
        guard let left = leftItems.first(where: { $0.pairID == pairID }),
              let right = rightItems.first(where: { $0.pairID == pairID }) else {
            return nil
        }
        return (left.text, right.text)
    }
    
    private func checkPair(leftIndex: Int, rightIndex: Int) {
        let left = leftItems[leftIndex]
        let right = rightItems[rightIndex]

        if left.pairID == right.pairID {
            leftItems[leftIndex].isMatched = true
            rightItems[rightIndex].isMatched = true
            continueWrong = false
            lastCorrectPair = nil
            rightAttempts[right.id] = -1
            leftAttempts[left.id] = -1

            if leftItems.allSatisfy({ $0.isMatched }) {
                continueActive = true
            }
        } else {
            continueWrong = true
            lastCorrectPair = getCorrectPair(for: left.pairID)
            rightAttempts[right.id, default: 0] += 1
            leftAttempts[left.id, default: 0] += 1
        }
    }

    
}

