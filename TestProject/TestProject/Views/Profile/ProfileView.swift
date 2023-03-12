//
//  ProfileView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            GeometryReader { reader in
                                Color.backgroundColor
                                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                                    .ignoresSafeArea()
                            }
            
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Image(systemName: "arrow.left")
                            .padding(.leading, 20)
                        Text(StringConstants.profileTitle)
                            .font(.montserrat(.bold, size: 12))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.trailing, 40)
                    }
                    .padding(.bottom, 20)
                }
                
                List(viewModel.profileSettings, id: \.title) { item in
                    if case .header = item {
                      ProfileHeaderCell(viewModel: viewModel)
                    } else {
                        ProfileSettingsCell(item: item)
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
            }
            .padding(.bottom, 63)
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
