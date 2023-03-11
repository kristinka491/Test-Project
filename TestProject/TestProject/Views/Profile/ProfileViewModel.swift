//
//  ProfileViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem?
    @Published var selectedImageData: Data?
    
    var profileSettings: [ProfileSettingsEnum]
    
    init() {
        profileSettings = [.header, .tradeStore, .paymentMethod, .balance(amount: StringConstants.profileBalanceAmount),
                           .tradeHistory, .restorePurchase, .help, .logOut]
    }
}
