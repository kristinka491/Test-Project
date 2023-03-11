//
//  View+Extension.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
