//
//  SearchWordsModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-14.
//

import Foundation

struct SearchWordsModel: Decodable {
    var words: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case words
    }
}


