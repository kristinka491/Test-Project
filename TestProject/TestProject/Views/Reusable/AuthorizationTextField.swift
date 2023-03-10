//
//  AuthorizationTextField.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct AuthorizationTextField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .multilineTextAlignment(.center)
            .frame(height: 29)
            .font(.montserrat(.regular, size: 12))
            .foregroundColor(.placeholderColor)
            .background(Color.placeholderBackgroundColor)
            .cornerRadius(20)
            .autocorrectionDisabled(true)
    }
}

struct AuthorizationTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        AuthorizationTextField(placeHolder: "Test", text: $field)
    }
}
