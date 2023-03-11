//
//  ProfileViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation

class ProfileViewModel: ObservableObject {
    var profileSettings: [ProfileSettingsEnum]
    
    init() {
        profileSettings = [.header, .tradeStore, .paymentMethod, .balance(amount: StringConstants.profileBalanceAmount),
                           .tradeHistory, .restorePurchase, .help, .logOut]
    }
}
