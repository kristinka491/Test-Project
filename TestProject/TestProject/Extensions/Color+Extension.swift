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
    static let iconsColor = Color.hexStringToColor(hex: "#909090")
    static let selectedTabBarItemColor = Color.hexStringToColor(hex: "#EEEFF4")
    static let userPhotoBorderColor = Color.hexStringToColor(hex: "#4E4D4D")
    static let homeTextColor = Color.hexStringToColor(hex: "#5B5B5B")
    static let homeTextFieldColor = Color.hexStringToColor(hex: "#F5F6F7")
    static let categoriesColor = Color.hexStringToColor(hex: "#A6A7AB")
    static let additionalCategoriesColor = Color.hexStringToColor(hex: "#C4C4C4D9")
    static let homeCategoryColor = Color.hexStringToColor(hex: "#070604")
    static let addButtonColor = Color.hexStringToColor(hex: "#545589")
    static let addButtonAdditionalColor = Color.hexStringToColor(hex: "#E5E9EFD9")
    static let discountBackgroundColor = Color.hexStringToColor(hex: "#F93A3A")
    static let tabBarSelectionColor = Color.hexStringToColor(hex: "#737297")
    static let additionalCategoryBackgroundColor = Color.hexStringToColor(hex: "#C4C4C4")
    static let additionlButtonsColor = Color.hexStringToColor(hex: "#E5E9EF")
    static let detailViewAdditionalColor = Color.hexStringToColor(hex: "#737373")
    static let borderColor = Color.hexStringToColor(hex: "#ADADAD")
    static let addToCartTitleColor = Color.hexStringToColor(hex: "#99A0FF")
    static let viewBackground = Color.hexStringToColor(hex: "#181726")
    static let detailImageBorderColor = Color.hexStringToColor(hex: "EBEBEB")
    
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
