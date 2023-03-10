//
//  Font+Extension.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

extension Font {
    enum MontserratFont {
        case regular
        case bold
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "Montserrat-Regular"
            case .bold:
                return "Montserrat-Bold"
            case .custom(let name):
                return name
            }
        }
    }

    static func montserrat(_ type: MontserratFont, size: CGFloat = 13) -> Font {
        return .custom(type.value, size: size)
    }
}
