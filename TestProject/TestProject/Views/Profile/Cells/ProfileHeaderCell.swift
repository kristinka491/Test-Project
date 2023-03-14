//
//  ProfileHeaderCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI
import PhotosUI

struct ProfileHeaderCell: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            if let data = viewModel.selectedImageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .configureImage()
            } else {
                Image("ProfileImage")
                    .configureImage()
            }
            
            PhotosPicker(
                selection: $viewModel.selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text(StringConstants.profileChangePhotoButtonTitle)
                        .font(.montserrat(.bold, size: 8))
                        .foregroundColor(.additionalTextColor)
                }
            .padding(.bottom, 20)
            .onChange(of: viewModel.selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        viewModel.selectedImageData = data
                    }
                }
            }
            
            Text(StringConstants.profileUsername)
                .font(.montserrat(.bold, size: 12))
            Button(action: {
                debugPrint("Tapped Upload Item button")
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
        .padding(.bottom, 4)
    }
}

fileprivate extension Image {
    
    func configureImage() -> some View {
        return self.resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.bottom, 9)
    }
}

struct ProfileHeaderCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderCell(viewModel: ProfileViewModel())
    }
}
