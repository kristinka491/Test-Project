//
//  HorizontalLabelStyle.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//
import SwiftUI

struct HorizontalLabelStyle: LabelStyle {
    var spacing: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
            configuration.title
            Spacer()
        }.frame(maxWidth: .infinity)
    }
}
