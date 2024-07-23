//
//  LandingCardView.swift
//  iosApp
//
//  Created by Siddesh Pillai on 7/23/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct LandingCardView: View {
    let title: String
    let message: String
    let buttonText: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: "map.fill") // Replace with your actual image asset
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Text(message)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                // Handle sign in action
            }) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color)
//                    .background(Color(hex: "41A78D"))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
    }
}

// Helper extension to create Color from hex
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct LandingCardView_Previews: PreviewProvider {
    static var previews: some View {
        LandingCardView(title: "ArcGIS StoryMaps", message: "Combine ArcGIS web maps, surveys, dashboards, and more into a unified digital experience.", buttonText: "Sign into ArcGIS StoryMaps", color: Color(hex: "41A78D"))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.1))
    }
}
