//
//  Skills.swift
//  Revan
//
//  Created by Willas Daniel Rorrong Lumban Tobing on 09/05/25.
//

import SwiftUI

struct Skills: View {
    var body: some View {
        ZStack{
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 160, height: 120)
                .opacity(0.1)
                .shadow(radius: 4)
            HStack{
                Image("typescript")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("wwww")
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    Skills()
}
