//
//  TabbarView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct TabbarView: View {
    @StateObject var viewModel = TabBarViewModel()
    @State var selectedTab = ""
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(viewModel.pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem{
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            
            HStack {
                ForEach(Array(viewModel.pages.enumerated()), id: \.element) { index, item in
                    Button(action: {
                        selectedTab = item.tag
                        viewModel.updateSelectedButton(with: index)
                    })
                    { ZStack {
                        Image(systemName: item.icon)
                            .imageScale(.medium)
                            .padding()
                            .foregroundColor(viewModel.buttonsStyle[index].isSelected ? Color.tabBarSelectionColor : Color.iconsColor)
                        }
                    }
                    .buttonStyle(viewModel.buttonsStyle[index])
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .frame(height: 63)
            .background( Color.white)
            .cornerRadius(27, corners: [.topLeft, .topRight])
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
