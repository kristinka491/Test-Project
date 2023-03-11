//
//  ProfileHeaderCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI

struct ProfileHeaderCell: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("ProfileImage")
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.bottom, 9)
            
            Button(action: {
                //                    TODO:
                print("----")
            }, label: {
                Text(StringConstants.profileChangePhotoButtonTitle)
                    .font(.montserrat(.bold, size: 8))
                    .foregroundColor(.additionalTextColor)
            })
            .padding(.bottom, 20)
            
            Text(StringConstants.profileUsername)
                .font(.montserrat(.bold, size: 12))
            Button(action: {
                //                    TODO:
                print("----")
            }, label: {
                HStack(spacing: 0) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.buttonForegroundColor)
                        .padding(.leading, 58)
                    
                    Text(StringConstants.profileUploadItemButtonTitle)
                        .font(.montserrat(.bold, size: 14))
                        .foregroundColor(.buttonForegroundColor)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 78)
                }
            })
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(Color.buttonBackgroundColor)
            .cornerRadius(15)
            .padding(.top, 38)
            .padding(.leading, 43)
            .padding(.trailing, 42)
        }
        .background(Color.backgroundColor)
        .listRowBackground(Color.backgroundColor)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 4, trailing: 0))
    }
}

struct ProfileHeaderCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderCell()
    }
}
