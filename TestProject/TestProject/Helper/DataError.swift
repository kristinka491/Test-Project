//
//  DataError.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation

enum DataError {
    case userIsRegistered
    case wrongUsernameOrPassword

    var title: String {
        switch self {
        case .userIsRegistered:
            return StringConstants.userIsRegisteredTitle
        case .wrongUsernameOrPassword:
            return StringConstants.wrongNameOrPasswordTitle
        }
    }

    var message: String {
        switch self {
        case .userIsRegistered:
            return StringConstants.userIsRegisteredMessage
        case .wrongUsernameOrPassword:
            return StringConstants.wrongNameOrPasswordMessage
        }
    }
}
