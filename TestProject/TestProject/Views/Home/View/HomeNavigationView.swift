//
//  HomeNavigationView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import SwiftUI

struct HomeNavigationView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Image("Menu")
                .resizable()
                .frame(width: 22, height: 24)
                .padding(.leading, 15)
            
            HStack(spacing: 6) {
                Text(StringConstants.homeTitleOne)
                    .font(.montserrat(.bold, size: 19))
                
                Text(StringConstants.homeTitleTwo)
                    .font(.montserrat(.bold, size: 19))
                    .foregroundColor(Color.buttonBackgroundColor)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 22)
            
            VStack(spacing: 11) {
                Image("ProfileImage")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.userPhotoBorderColor,
                                        lineWidth: 1))
                
                HStack(spacing: 4) {
                    Text(StringConstants.homeLocations)
                        .font(.montserrat(.regular, size: 8))
                        .foregroundColor(.homeTextColor)
                    
                    Image("Arrow")
                }
                .padding(.bottom, 11)
            }
            .padding(.trailing, 37)
        }
    }
}

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
    }
}
