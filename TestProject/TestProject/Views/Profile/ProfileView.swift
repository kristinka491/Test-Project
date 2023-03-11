//
//  ProfileView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack(spacing: 140) {
                    Image(systemName: "arrow.left")
                    
                    Text(StringConstants.profileTitle)
                        .font(.montserrat(.bold, size: 12))
                }
                .padding(.bottom, 20)
                .padding(.leading, 20)
                
                
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
                    HStack(alignment: .center, spacing: 46) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color.buttonForegroundColor)
                        Text(StringConstants.profileUploadItemButtonTitle)
                            .font(.montserrat(.bold, size: 14))
                            .foregroundColor(.buttonForegroundColor)
                    }
                })
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .background(Color.buttonBackgroundColor)
                .cornerRadius(15)
                .padding(.top, 38)
                .padding(.leading, 43)
                .padding(.trailing, 42)
                Spacer()

            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
