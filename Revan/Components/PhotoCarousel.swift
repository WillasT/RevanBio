//
//  PhotoCarousel.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 18/05/25.
//

import SwiftUI

struct PhotoCarousel: View {
    let imageNames: [String]
    @State private var currentIndex = 0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            ZStack {
                ForEach(imageNames.indices, id: \.self) { i in
                    if i == currentIndex {
                        Image(imageNames[i])
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .transition(.opacity)
                    }
                }
            }
            .animation(.easeInOut(duration: 0.4), value: currentIndex)

            HStack {
                Button(action: {
                    currentIndex = (currentIndex - 1 + imageNames.count) % imageNames.count
                    startAutoPlay()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color("main"))
                        .shadow(radius: 4)
                }
                .padding(.leading)

                Spacer()

                Button(action: {
                    currentIndex = (currentIndex + 1) % imageNames.count
                    startAutoPlay() 
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color("main"))
                        .shadow(radius: 4)
                }
                .padding(.trailing)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 480)
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .padding(.horizontal)
        .onAppear {
            startAutoPlay()
        }
        .onDisappear {
            stopAutoPlay()
        }
    }

    func startAutoPlay() {
        stopAutoPlay()
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % imageNames.count
        }
    }

    func stopAutoPlay() {
        timer?.invalidate()
        timer = nil
    }
}


#Preview {
    PhotoCarousel(
        imageNames: [
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
        ]
    )
}
