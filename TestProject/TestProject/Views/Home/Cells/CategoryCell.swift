//
//  CategoryCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import SwiftUI

struct CategoryCell: View {
    var item: CategoryEnum
    
    var body: some View {
        VStack(spacing: 14) {
            Image(item.imageName ?? "")
                .frame(width: 42, height: 38)
                .background(Color.selectedTabBarItemColor)
                .clipShape(Circle())
            
            Text(item.title ?? "")
                .font(.montserrat(.regular, size: 10))
                .foregroundColor(Color.categoriesColor)
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(item: .headphones)
    }
}
