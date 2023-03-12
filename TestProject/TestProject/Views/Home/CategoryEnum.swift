//
//  CategoryEnum.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation

enum CategoryEnum: CaseIterable {
    case phones
    case headphones
    case games
    case cars
    case furniture
    case kids
    
    var title: String? {
        switch self {
        case .phones:
            return "Phones"
        case .headphones:
            return "Headphones"
        case .games:
            return "Games"
        case .cars:
            return "Cars"
        case .furniture:
            return "Furniture"
        case .kids:
            return "Kids"
        }
    }
    
    var imageName: String? {
        switch self {
        case .phones:
            return "Phones"
        case .headphones:
            return "Headphones"
        case .games:
            return "Games"
        case .cars:
            return "Cars"
        case .furniture:
            return "Furniture"
        case .kids:
            return "Kids"
        }
    }
}
