//
//  TabBarViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-11.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var pages: [TabBarPage]
    @Published var buttonsStyle = [StaticButtonStyle]()
    
    init() {
        pages = [TabBarPage(page: HomeView(), icon: "house", tag: "Home"),
                 TabBarPage(page: MockView(), icon: "heart", tag: "Favorites"),
                 TabBarPage(page: MockView(), icon: "cart", tag: "Cart"),
                 TabBarPage(page: MockView(), icon: "message", tag: "Chat"),
                 TabBarPage(page: ProfileView(), icon: "person", tag: "Profile")]
        
        setupButtonsStyle()
    }
    
    func updateSelectedButton(with index: Int) {
        for i in 0..<buttonsStyle.count {
            buttonsStyle[i].isSelected = false
        }
        buttonsStyle[index].isSelected = true
    }
    
    private func setupButtonsStyle() {
        buttonsStyle = [StaticButtonStyle](repeating: StaticButtonStyle(isSelected: false), count: pages.count)
        if buttonsStyle.count > 0 {
            buttonsStyle[0].isSelected = true
        }
    }
}
