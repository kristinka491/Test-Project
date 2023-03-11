//
//  StaticButtonStyle.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI

struct StaticButtonStyle: ButtonStyle {
    var isSelected = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(isSelected ? Color.selectedTabBarItemColor : Color.white)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}
