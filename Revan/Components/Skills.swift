//
//  Skills.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 09/05/25.
//

import SwiftUI

struct Skills: View {
    
    let skills: [Skill] = [
        Skill(name: "TypeScript", imageName: "typescript"),
        Skill(name: "React", imageName: "react"),
        Skill(name: "NextJS", imageName: "nextjs"),
        Skill(name: "JavaScript", imageName: "javascript"),
        Skill(name: "C", imageName: "c"),
        Skill(name: "C++", imageName: "c++"),
        Skill(name: "Python", imageName: "python"),
        Skill(name: "Swift", imageName: "swift")
    ]
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    let cardWidth: CGFloat = 160
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(skills.enumerated()), id: \.element.id) { index, skill in
                        SkillCard(skill: skill)
                            .id(index)
                    }
                }
                .padding(.horizontal, (UIScreen.main.bounds.width - cardWidth)/2)
            }
            .frame(height: 100)
            .onAppear {
                resumeAutoScroll(with: proxy)
            }
            .onDisappear {
                stopAutoScroll()
            }
        }
    }
    
    func startAutoScroll(with proxy: ScrollViewProxy) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
            currentIndex = (currentIndex + 1) % skills.count
            DispatchQueue.main.async {
                withAnimation {
                    proxy.scrollTo(currentIndex, anchor: .center)
                }
            }
        }
    }
    
    func scrollToCurrentIndex(using proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo(currentIndex, anchor: .center)
        }
    }
    
    func resumeAutoScroll(with proxy: ScrollViewProxy) {
        stopAutoScroll()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % skills.count
            DispatchQueue.main.async {
                scrollToCurrentIndex(using: proxy)
            }
        }
    }
    
    func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
    }
}

struct SkillCard: View {
    let skill: Skill
    
    var body: some View {
        ZStack{
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 160, height: 80)
                .opacity(0.1)
                .shadow(radius: 4)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            HStack{
                Image(skill.imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(skill.name)
                    .font(.headline)
                Spacer(minLength: 0)
            }
            .frame(maxWidth: 140)
        }
    }
}

#Preview {
    Skills()
}
