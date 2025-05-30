//
//  Skills.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 09/05/25.
//

import SwiftUI

struct Skills: View {
    
    let skills: [Skill] = [
        Skill(name: "TypeScript", imageName: "typescript", totalProjects: 34),
        Skill(name: "JavaScript", imageName: "javascript", totalProjects: 8),
        Skill(name: "Python", imageName: "python", totalProjects: 8),
        Skill(name: "PHP", imageName: "php", totalProjects: 2),
        Skill(name: "GO", imageName: "go", totalProjects: 2),
        Skill(name: "Swift", imageName: "swift", totalProjects: 2),
        Skill(name: "Astro", imageName: "astro", totalProjects: 1),
        Skill(name: "Rust", imageName: "rust", totalProjects: 1),
    ]
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    @State private var scrollViewProxy: ScrollViewProxy?
    
    let cardWidth: CGFloat = 160
    var infiniteSkills: [Skill] {
        guard let first = skills.first, let last = skills.last else { return skills }
        return [last] + skills + [first]
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(infiniteSkills.enumerated()), id: \.offset) { index, skill in
                        SkillCard(skill: skill)
                            .id(index)
                    }
                }
                .padding(.horizontal, (UIScreen.main.bounds.width - cardWidth)/2)
            }
            .frame(height: 100)
            .onAppear {
                DispatchQueue.main.async {
                    proxy.scrollTo(1, anchor: .center)
                    currentIndex = 1
                }
                resumeAutoScroll(with: proxy)
            }
            .onDisappear {
                stopAutoScroll()
            }
        }
    }
    
    func scrollTo(_ index: Int, using proxy: ScrollViewProxy, animated: Bool = true) {
            if animated {
                withAnimation {
                    proxy.scrollTo(index, anchor: .center)
                }
            } else {
                proxy.scrollTo(index, anchor: .center)
            }
        }
    
    func resumeAutoScroll(with proxy: ScrollViewProxy) {
            stopAutoScroll()
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                currentIndex += 1
                DispatchQueue.main.async {
                    scrollTo(currentIndex, using: proxy)

                    // Reset for infinite loop illusion
                    if currentIndex == infiniteSkills.count - 1 {
                        currentIndex = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            scrollTo(currentIndex, using: proxy, animated: false)
                        }
                    }
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
                .clipShape(RoundedRectangle(cornerRadius: 8))
            HStack{
                Image(skill.imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading){
                    Text(skill.name)
                        .font(.headline)
                    Text("\(skill.totalProjects) projects")
                        .font(.caption)
                        .foregroundStyle(.primary.opacity(0.8))
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            .frame(maxWidth: 200)
        }
    }
}

#Preview {
    Skills()
}
