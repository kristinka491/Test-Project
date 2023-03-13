//
//  DetailGoods.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import Foundation

struct DetailGoods: Decodable, PriceFormatter {
    var name: String?
    var description: String?
    var rating: Double?
    var numberOfReviews: Int?
    var price: Double?
    var colors: [String]?
    var imageURLS: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case name, description, rating, price, colors, numberOfReviews = "number_of_reviews", imageURLS = "image_urls"
    }

    var ratingString: String {
        return "\(rating ?? 0)"
    }
    
    var numberOfReviewsString: String {
        return "( \(numberOfReviews ?? 0) reviews)"
    }
    
    var priceString: String {
        return priceString(price: price)
    }
}
