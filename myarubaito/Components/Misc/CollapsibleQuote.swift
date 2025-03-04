//
//  CollapsibleQuote.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

struct CollapsibleQuote: View {
    let retailQuotes = [
        "Some customers bring sunshine, others bring... receipts.",
        "Retail math: '5 minutes of help' = 30 minutes of explaining.",
        "The customer is always right... except when they're not.",
        "Why yes, I totally control the inventory system 🤨."
    ]
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header/Toggle
            HStack {
                HStack(spacing: 6) {
                    Text("Random Retail Thoughts 💭")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Theme.teal.opacity(0.05))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            }
            
            // Quote
            if isExpanded {
                Text(retailQuotes.randomElement() ?? "No quotes today 😕")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Theme.teal.opacity(0.02))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
