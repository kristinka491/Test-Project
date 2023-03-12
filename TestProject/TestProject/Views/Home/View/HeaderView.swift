//
//  HeaderView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.montserrat(.bold, size: 16))
            Spacer()
            Text(StringConstants.homeViewAll)
                .font(.montserrat(.regular, size: 10))
                .foregroundColor(.additionalTextColor)
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 1)
        .padding(.trailing, 13)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: StringConstants.homeLatest)
    }
}
