//
//  LatestGoodsCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import SwiftUI

struct LatestGoodsCell: View {
    var item: GoodsModel
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: item.imageURL ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 114, height: 149)
            .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 6) {
                Spacer()

                HStack(spacing: 0) {
                    Text(item.category ?? "")
                        .frame(height: 18)
                        .font(.montserrat(.bold, size: 8))
                        .foregroundColor(Color.homeCategoryColor)
                        .padding(.leading, 8)
                        .padding(.trailing, 7)
                        .background(Color.additionalCategoryBackgroundColor)
                        .opacity(0.85)
                        .cornerRadius(8)
                    
                    Spacer()
                }
                .padding(.trailing, 7)
               
                Text(item.name ?? "")
                    .font(.montserrat(.bold, size: 10))
                    .lineLimit(1)
                    .foregroundColor(.white)
                
                HStack(spacing: 0) {
                    Text(item.priceString)
                        .font(.montserrat(.bold, size: 9))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.addButtonColor)
                        .background(Color.additionlButtonsColor)
                        .opacity(0.85)
                        .clipShape(Circle())
                }
                .padding(.trailing, 5)
            }
            .padding(.leading, 7)
            .padding(.bottom, 7)
        }
    }
}

struct LatestGoodsCell_Previews: PreviewProvider {
    static var previews: some View {
        LatestGoodsCell(item: GoodsModel())
    }
}
