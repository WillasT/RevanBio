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
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.systemBackground)
                .ignoresSafeArea()
            
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
                        PlayButton()
                            .padding(.bottom, 20)
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
                    }
                    .foregroundColor(.primary)
                    .padding()
                    Text("wywuyng")
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
