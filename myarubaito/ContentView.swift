//
//  ContentView.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-02-25.

import SwiftUI


struct Theme {
    static let teal = Color(red: 56/255, green: 178/255, blue: 172/255)
    static let darkTeal = Color(red: 22/255, green: 71/255, blue: 68/255)
    static let backgroundColor = Color(red: 245/255, green: 247/255, blue: 250/255)
    static let cardShadow = Color.black.opacity(0.1)
}

struct ContentView: View {
    @State private var selectedOption = "Upcoming"
    let retailQuotes = [
        "Some customers bring sunshine, others bring... receipts.",
        "Retail math: '5 minutes of help' = 30 minutes of explaining.",
        "The customer is always right... except when they're not.",
        "Why yes, I totally control the inventory system 🤨."
    ]
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        TabView {
            ScrollView {
                VStack(spacing: 25) {
                    headerSection
                    segmentedControlSection
                    nextShiftCard
                    WeekOverviewCard()
                    CollapsibleQuote(quote: retailQuotes.randomElement() ?? "No quote today")
                   
                }
                .padding(.top, 50)
            }
            .background(Theme.backgroundColor)
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(Theme.teal)
    }
    
    // MARK: - View Components
    
    private var headerSection: some View {
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
    
    private var segmentedControlSection: some View {
        Picker("Select", selection: $selectedOption) {
            Text("Upcoming").tag("Upcoming")
            Text("This Week").tag("This Week")
            Text("This Month").tag("This Month")
        }
        .pickerStyle(.segmented)
        .padding()
        .background(Color.white)
    }
    
    private var nextShiftCard: some View {
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

struct WeekOverviewCard: View {
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
                Text("This Week's Overview")
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



struct CollapsibleQuote: View {
    let quote: String
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
                Text(quote)
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

// MARK: - Supporting Views

struct ShiftInfoRow: View {
    let icon: String
    let title: String
    let value: String
    var valueColor: Color = .black
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Theme.teal)
                .frame(width: 25)
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .foregroundColor(valueColor)
        }
    }
}

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

struct StatBox: View {
    let value: String
    let label: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: color.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}



struct CalendarView: View {
    var body: some View {
        Text("Calendar View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

#Preview {
    ContentView()
}
