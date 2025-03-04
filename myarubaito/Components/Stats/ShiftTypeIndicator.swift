//
//  ShiftTypeIndicator.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI


struct ShiftTypeIndicator: View {
    let count: Int
    let label: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .foregroundColor(Theme.teal)
                Text("\(count)")
                    .font(.system(size: 18, weight: .semibold))
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Theme.cardShadow, radius: 3, x: 0, y: 2)
        )
    }
}
