//
//  TimeFrameControl.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

struct TimeFrameControl: View {
  
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Picker("Select", selection: $viewModel.selectedTimeFrame) {
            Text("Upcoming").tag("Upcoming")
            Text("This Week").tag("This Week")
            Text("This Month").tag("This Month")
        }
        .pickerStyle(.segmented)
        .padding()
        .background(Color.white)
    }
}
