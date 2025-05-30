//
//  ContentView.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.2
    @State private var hasScrolledBottom = false
    @State private var imageHasAppeared = false
    @State private var animateGradient = false
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                LinearGradient(
                    gradient: Gradient(colors: colorScheme == .dark
                                       ? [Color("main").opacity(0.5), .black]
                                       : [Color("main").opacity(0.5), Color("main").opacity(0.1)]),
                    startPoint: animateGradient ? .topTrailing : .bottomTrailing,
                    endPoint: animateGradient ? .bottomLeading : .topLeading
                )
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animateGradient)
                .onAppear {
                    animateGradient = true
                }
                GeometryReader{ outerGeo in
                    ScrollView{
                        VStack (alignment: .leading){
                            GeometryReader { geo in
                                Image("Revan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width)
                                    .offset(y: -geo.frame(in: .named("scrollView")).minY / 3)
                                    .opacity(imageHasAppeared ? 1 : 0)
                                    .animation(.easeOut(duration: 1.5), value: imageHasAppeared)
                                    .onAppear {
                                        imageHasAppeared = true
                                    }
                            }
                            .frame(height: 300)
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text("Mochamad Revanza Kurniawan")
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
                                    PlayButton{
                                        viewModel.isActive = true
                                    }
                                    .blur(radius: hasScrolledBottom ? 0 : 5)
                                    .disabled(!hasScrolledBottom)
                                    if !hasScrolledBottom{
                                        Color.primary.opacity(0.6)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                        Text("You need to learn about Revan to acces the Quiz")
                                            .font(.footnote)
                                            .fontWeight(.semibold)
                                            .foregroundColor(colorScheme == .dark ? .black : .white)
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
                                        .tint(Color("main"))
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
                                Text("Favorite Music")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                MusicPlayer()
                                    .padding(.top, 4)
                                Text("Skills")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                Skills()
                                    .padding(.top, 4)
                                
                                Text("Games")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                Games()
                                    .padding(.top, 4)
                                Text("Favorite Photos")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                PhotoCarousel(imageNames: [
                                    "favphoto1",
                                    "favphoto2",
                                    "favphoto3",
                                    "favphoto4",
                                    "favphoto5",
                                    "favphoto6",
                                    "favphoto7",
                                    "favphoto8",
                                    "favphoto9",
                                    "favphoto10",
                                    "favphoto11",
                                    "favphoto12",
                                    "favphoto13",
                                ])
                                .padding(.top, 4)
                                Color.clear
                                    .frame(height: 1)
                                    .background(
                                        GeometryReader { geo in
                                            Color.clear
                                                .preference(key: ViewOffsetKey.self  ,value: geo.frame(in: .named("scrollView")).maxY)
                                        }
                                    )
                            }
                            .foregroundColor(.primary)
                            .padding()
                            .onPreferenceChange(ViewOffsetKey.self) { value in
                                let scrollViewHeight = outerGeo.size.height
                                if value <= scrollViewHeight + 50 {
                                    hasScrolledBottom = true
                                }
                            }
                        }
                        .navigationTitle("Revan")
                        .navigationBarTitleDisplayMode(.large)
                    }
                    .coordinateSpace(name: "scrollView")
                }
            }
            .navigationDestination(isPresented: $viewModel.isActive){
                QuizView()
            }
        }
        .tint(Color("main"))
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
