//
//  ShiftInfoRow.swift
//  myarubaito
//
//  Created by Lucas da Silva Rocha on 2025-03-04.
//

import SwiftUI

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

