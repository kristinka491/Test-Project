//
//  PriceFormatter.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import Foundation

protocol PriceFormatter {
    func priceString(price: Double?) -> String
}

extension PriceFormatter {
    
    func priceString(price: Double?) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return "$ \(numberFormatter.string(from: (price ?? 0.0) as NSNumber) ?? "")"
    }
}
