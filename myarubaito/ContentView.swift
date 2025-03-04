//
//  ContentView.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-02-25.

import SwiftUI

struct ContentView: View {
    
    // @StateObject ensures the ViewModel lives as long as ContentView
    @StateObject private var viewModel = HomeViewModel()
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        TabView {
            ScrollView {
                VStack(spacing: 25) {
                    HeaderSection()
                    TimeFrameControl(viewModel: viewModel)
                    NextShiftCard()
                    OverviewCard(viewModel: viewModel)
                    CollapsibleQuote()
                    
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

}


#Preview {
    ContentView()
}
