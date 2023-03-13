//
//  GoodsModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation

struct LatestGoodsModel: Decodable {
    var latest: [GoodsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case latest
    }
}

struct FlashSaleGoodsModel: Decodable {
    var flashSale: [GoodsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct GoodsModel: Decodable, PriceFormatter {
    var category: String?
    var name: String?
    var price: Double?
    var discount: Int?
    var imageURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case category, name, price, discount, imageURL = "image_url"
    }
    
    var discountString: String {
        return "\(discount ?? 0)% off"
    }
    
    var priceString: String {
        return priceString(price: price)
    }
}
