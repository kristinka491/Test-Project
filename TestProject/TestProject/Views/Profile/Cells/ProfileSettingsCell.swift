//
//  ProfileSettingsCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import SwiftUI

struct ProfileSettingsCell: View {
    @Environment(\.presentationMode) var presentationMode
    
    var item: ProfileSettingsEnum
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: item.imageName ?? "")
                .frame(width: 40, height: 40)
                .background(Color.selectedTabBarItemColor)
                .clipShape(Circle())
            
            Text(item.title ?? "")
                .font(.montserrat(.regular, size: 14))
            
            
            if let _ = item.nextView {
                Spacer()
                Image("NavigationButton")
            }
            if case .balance(let amount) = item {
                Spacer()
                Text(amount)
                    .font(.montserrat(.regular, size: 14))
            }
        }
        .frame(height: 60)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.backgroundColor)
        .listRowInsets(.init(top: 0, leading: 32, bottom: 0, trailing: 46))
        .onTapGesture {
            if case .logOut = item {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ProfileSettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsCell(item: .help)
    }
}
