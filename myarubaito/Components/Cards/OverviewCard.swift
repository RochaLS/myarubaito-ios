//
//  OverviewCard.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

struct OverviewCard: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var timeframeLabel: String {
        switch viewModel.selectedTimeFrame {
           case "Upcoming":
               return "Upcoming Overview"
           case "This Week":
               return "This Week's Overview"
           case "This Month":
               return "This Month's Overview"
           default:
               return "Overview"
           }
       }
    
    let totalShifts = 5
    let completedShifts = 3
    let totalHours = 32.5
    
    // Shift type breakdown
    let openingShifts = 2
    let midShifts = 1
    let closingShifts = 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header with completion status
            HStack {
                Text(timeframeLabel)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text("\(completedShifts)/\(totalShifts) Shifts Complete")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Theme.teal)
                        .frame(width: geometry.size.width * CGFloat(completedShifts) / CGFloat(totalShifts), height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
            
            // Main stats
            HStack(spacing: 25) {
                StatBox(
                    value: "\(totalShifts)",
                    label: "Total Shifts",
                    icon: "calendar.badge.clock",
                    color: Theme.teal
                )
                
                StatBox(
                    value: String(format: "%.1f", totalHours),
                    label: "Total Hours",
                    icon: "hourglass",
                    color: Theme.teal
                )
            }
            
            // Divider
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)
            
            // Shift type breakdown
            VStack(alignment: .leading, spacing: 12) {
                Text("Shift Types")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    ShiftTypeIndicator(
                        count: openingShifts,
                        label: "Opening",
                        icon: "sunrise.fill"
                    )
                    
                    ShiftTypeIndicator(
                        count: midShifts,
                        label: "Mid",
                        icon: "sun.max.fill"
                    )
                    
                    ShiftTypeIndicator(
                        count: closingShifts,
                        label: "Closing",
                        icon: "moon.stars.fill"
                    )
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Theme.cardShadow, radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}
