//
//  Color+Extension.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI


extension Color {
    
    static let headerColor = Color.hexStringToColor(hex: "#161826")
    static let placeholderColor = Color.hexStringToColor(hex: "#7B7B7B")
    static let placeholderBackgroundColor = Color.hexStringToColor(hex: "#E8E8E8")
    static let backgroundColor = Color.hexStringToColor(hex: "#FAF9FF")
    static let buttonBackgroundColor = Color.hexStringToColor(hex: "#4E55D7")
    static let buttonForegroundColor = Color.hexStringToColor(hex: "#EAEAEA")
    static let additionalTextColor = Color.hexStringToColor(hex: "#808080")
    static let loginButtonColor = Color.hexStringToColor(hex: "#254FE6")
    
    static func hexStringToColor(hex: String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return Color(UIColor.gray)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return Color(UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                             alpha: CGFloat(1.0)))
    }
}
