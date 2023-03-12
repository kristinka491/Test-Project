//
//  LResponse.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation

struct LResponse<T: Decodable> {
    var object: T?
    var data: Any?
    var error: NSError?
}

