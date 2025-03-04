//
//  ContentView.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-02-25.

import SwiftUI


struct ContentView: View {
    
    let teal = Color(red: 56/255, green: 178/255, blue: 172/255)
    let darkTeal = Color(red: 22/255, green: 71/255, blue: 68/255)
    let retailQuotes = [
        "Some customers bring sunshine, others bring... receipts.",
        "Retail math: '5 minutes of help' = 30 minutes of explaining.",
        "The customer is always right... except when they’re not.",
        "Why yes, I totally control the inventory system 🤨."
    ]
    
    @State private var selectedOption = "Upcoming"
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.darkGray
    }

    var body: some View {
        TabView {
            // Home Tab
            VStack {
                VStack(spacing: 10) {
                    Text("You are set to earn")
                        .font(.title)
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity)
                

                    Text("$1000.00")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundStyle(teal)

                    Text("in your upcoming shifts")
                        .font(.title)
                        .fontWeight(.light)
                }
                .padding(.top, 50)
                .padding()
                .foregroundStyle(Color.white)

                VStack(spacing: 36) {
                    Picker("Select", selection: $selectedOption) {
                        Text("Upcoming").tag("Upcoming")
                        Text("This Month").tag("This Month")
                        Text("This Week").tag("This Week")
                    }
                    .pickerStyle(.segmented)
                    .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(darkTeal) // Change background color
                        )
                        .onAppear {
                            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
                            UISegmentedControl.appearance().setTitleTextAttributes(
                                [.foregroundColor: UIColor.white], for: .normal
                            )
                            UISegmentedControl.appearance().setTitleTextAttributes(
                                [.foregroundColor: UIColor.black], for: .selected
                            )
                        }
                    .padding()
                    // Buttons with improved styles
//                    HStack(spacing: 10) {
//                        ForEach(["Upcoming", "This Month", "This Week"], id: \.self) { title in
//                            Button(action: {
//                                print("\(title) tapped")
//                            }) {
//                                Text(title)
//                                    .font(.callout)
//                                    .fontWeight(.semibold)
//                                    .padding(12)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color(red: 22/255, green: 71/255, blue: 68/255))
//                                    .foregroundColor(Color.white)
//                                    .cornerRadius(10)
//                            }
//                            .shadow(radius: 5)
//                        }
//                    }

                    // Next Shift Card
                    VStack(spacing: 15) {
                        Text("Next Shift")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("📅 Date:")
                                    .fontWeight(.semibold)
                                Text("Monday Jan 13rd")
                            }
                            
                            HStack {
                                Text("🕒 Time:")
                                    .fontWeight(.semibold)
                                Text("3:30 PM - 5:00 PM")
                                    .foregroundColor(.black)
                            }
                            
                            HStack {
                                Text("💼 Type:")
                                    .fontWeight(.semibold)
                                Text("Closing Shift")
                                    .foregroundColor(.black)
                            }
                            
                            HStack {
                                Text("💰 Earnings:")
                                    .fontWeight(.semibold)
                                Text("$110.26")
                                    .foregroundColor(teal)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)

                    // Upcoming Shifts Section
                    VStack(spacing: 15) {
                        Text("Retail Wisdom of the Day")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 5)
                            
                        Text(retailQuotes.randomElement() ?? "No quotes found.") // Your dynamic quote
                                .font(.body)
                                .italic()
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                               
                            
                            Text("🛒 Remember, you're not alone out there!")
                                .font(.caption)
                                .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .background(LinearGradient(
                gradient: Gradient(colors: [
                    teal,
                    Color.white.opacity(0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .ignoresSafeArea(edges: .top)

            VStack {
                Text("Calendar View Here")
                    .font(.largeTitle)
                    .padding()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }

            // Settings Tab
            VStack {
                Text("Settings View Here")
                    .font(.largeTitle)
                    .padding()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .accentColor(teal)
    }
}

#Preview {
    ContentView()
}
