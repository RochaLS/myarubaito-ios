//
//  HeaderSection.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

struct HeaderSection: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("You are set to earn")
                .font(.title2)
                .fontWeight(.medium)
            
            Text("$1,000.00")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(Theme.teal)
            
            Text("in your upcoming shifts")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Theme.cardShadow, radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}
