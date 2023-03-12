//
//  GoodsModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation

struct GoodsModel: Decodable {
    var category: String?
    var name: String?
    var price: Double?
    var discount: Int?
    var imageURL: String?
    
    var priceString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return "$ \(numberFormatter.string(from: (price ?? 0.0) as NSNumber) ?? "")"
    }
    
    var discountString: String {
        return "\(discount ?? 0)% off"
    }
    
//    private enum CodingKeys: String, CodingKey {
//        case category, name, price, discount, imageURL
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        category = try container.decodeIfPresent(String.self, forKey: .category)
//        name = try container.decodeIfPresent(String.self, forKey: .name)
//        price = try container.decodeIfPresent(Double.self, forKey: .price)
//        discount = try container.decodeIfPresent(Int.self, forKey: .discount)
//        imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL)
//    }
}
