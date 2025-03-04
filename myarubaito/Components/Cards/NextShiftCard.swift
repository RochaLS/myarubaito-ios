//
//  NextShiftCard.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

struct NextShiftCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Next Shift")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "clock.fill")
                    .foregroundColor(Theme.teal)
            }
            
            VStack(spacing: 15) {
                ShiftInfoRow(icon: "calendar", title: "Date", value: "Monday Jan 13rd")
                ShiftInfoRow(icon: "clock", title: "Time", value: "3:30 PM - 5:00 PM")
                ShiftInfoRow(icon: "briefcase", title: "Type", value: "Closing Shift")
                ShiftInfoRow(icon: "dollarsign.circle", title: "Earnings", value: "$110.26", valueColor: Theme.teal)
            }
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

