//
//  DataError.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation

enum DataError {
    case userIsRegistered

    var title: String {
        switch self {
        case .userIsRegistered:
            return StringConstants.userIsRegisteredTitle
        }
    }

    var message: String {
        switch self {
        case .userIsRegistered:
            return StringConstants.userIsRegisteredMessage
        }
    }
}
