//
//  UIApplication+Extension .swift
//  TestProject
//
//  Created by Krystsina on 2023-03-23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
