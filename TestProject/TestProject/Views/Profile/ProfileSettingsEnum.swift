//
//  ProfileSettingsEnum.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI

enum ProfileSettingsEnum {
    case header
    case tradeStore
    case paymentMethod
    case balance(amount: String)
    case tradeHistory
    case restorePurchase
    case help
    case logOut
    
    var title: String? {
        switch self {
        case .tradeStore:
            return StringConstants.profileTradeStore
        case .paymentMethod:
            return StringConstants.profilePaymentMethod
        case .balance:
            return StringConstants.profileBalance
        case .tradeHistory:
            return StringConstants.profileTradeHistory
        case .restorePurchase:
            return StringConstants.profileRestorePurchase
        case .help:
            return StringConstants.profileHelp
        case .logOut:
            return StringConstants.profileLogOut
        default:
            return nil
        }
    }
    
    var imageName: String? {
        switch self {
        case .tradeStore, .paymentMethod, .balance, .tradeHistory:
            return "creditcard"
        case .restorePurchase:
            return "arrow.triangle.2.circlepath"
        case .help:
            return "questionmark.circle"
        case .logOut:
            return "ipad.and.arrow.forward"
        default:
            return nil
        }
    }
    
    var nextView: (any View)? {
        switch self {
        case .tradeStore, .paymentMethod, .tradeHistory, .restorePurchase:
            return MockView()
        default:
            return nil
        }
    }
}
