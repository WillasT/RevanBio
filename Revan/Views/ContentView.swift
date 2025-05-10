//
//  ContentView.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 07/05/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var progress = 0.2
    @State private var hasScrolledBottom = false
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.systemBackground)
                .ignoresSafeArea()
            
            GeometryReader{ outerGeo in
                ScrollView{
                    VStack (alignment: .leading){
                        Text("Revan's Life")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding()
                        PlayVideo()
                        VStack(alignment: .leading, spacing: 4){
                            Text("Revan")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            HStack{
                                Text("2025")
                                    .font(.headline)
                                AgeRating()
                                Text("10 months")
                                    .font(.headline)
                                HD()
                                Caption()
                                
                            }
                            ZStack{
                                PlayButton()
                                    .blur(radius: hasScrolledBottom ? 0 : 5)
                                    .disabled(!hasScrolledBottom)
                                
                                if !hasScrolledBottom{
                                    Color.secondary.opacity(0.4)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    Text("You need to learn about Revan to acces the Quiz")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .shadow(radius: 4)
                                        .transition(.opacity)
                                        .animation(.easeInOut, value: hasScrolledBottom)
                                    
                                }
                                
                            }
                            .padding(.bottom, 20)
                            .padding(.top, 10)
                            
                            HStack{
                                ProgressView(value: progress)
                                    .frame(width: 220)
                                    .padding(.bottom, 10)
                                Text("8 Months Remaining")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .offset(x: 5, y: -5)
                            }
                            
                            Text("A young developer who loves to code and dreams of exploring the world. He has now begun his journey as part of the Apple Developer Academy Cohort of 2025.")
                                .font(.headline)
                                .padding(.bottom, 8)
                            Text("Cast: Mochamad Revanza Kurniawan")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Director: Mochamad Revanza Kurniawan")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Skills")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top, 24)
                            Skills()
                                .padding(.top, 4)
                            Color.clear
                                .frame(height: 1)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear
                                            .preference(key: ViewOffsetKey.self  ,value: geo.frame(in: .global).minY)
                                    }
                                )
                            Text("Games")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top, 24)
    
                        }
                        .foregroundColor(.primary)
                        .padding()
                        .onPreferenceChange(ViewOffsetKey.self) { value in
                            let scrollViewHeight = outerGeo.size.height
                            if value < scrollViewHeight + 50 {
                                hasScrolledBottom = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


#Preview {
    ContentView()
}
