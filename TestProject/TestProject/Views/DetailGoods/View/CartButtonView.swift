//
//  CartButtonView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct CartButtonView: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .imageScale(.small)
            .frame(width: 38, height: 22)
            .foregroundColor(.white)
            .background(Color.buttonBackgroundColor)
            .cornerRadius(8)
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(imageName: "minus")
    }
}
