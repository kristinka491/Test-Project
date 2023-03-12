//
//  SaleGoodsCell.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import SwiftUI

struct SaleGoodsCell: View {
    var item: GoodsModel
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: item.imageURL ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 174, height: 221)
            .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 11) {
                HStack(spacing: 0) {
                    Image("SellerPhoto")
                        .frame(width: 24, height: 24)

                    Spacer()
                    
                    Text(item.discountString)
                        .font(.montserrat(.bold, size: 10))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 7)
                        .padding(.top, 4)
                        .padding(.bottom, 6)
                        .background(Color.discountBackgroundColor)
                        .cornerRadius(12)
                        
                }.padding([.leading, .trailing, .top], 8)
                
                Spacer()

                HStack(spacing: 0) {
                    Text(item.category ?? "")
                        .frame(height: 20)
                        .font(.montserrat(.bold, size: 10))
                        .foregroundColor(Color.homeCategoryColor)
                        .padding([.leading, .trailing], 16)
                        .background(Color.additionalCategoriesColor)
                        .opacity(0.85)
                        .cornerRadius(9)
                    
                    Spacer()
                }
                .padding(.trailing, 7)
               
                Text(item.name ?? "")
                    .font(.montserrat(.bold, size: 15))
                    .lineLimit(1)
                    .foregroundColor(.white)
                
                HStack(spacing: 5) {
                    Text(item.priceString)
                        .font(.montserrat(.bold, size: 11))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("Heart")
                        .frame(width: 28, height: 28)
                        .foregroundColor(.addButtonColor)
                        .background(Color.addButtonAdditionalColor)
                        .clipShape(Circle())
                    
                    Image(systemName: "plus")
                        .frame(width: 35, height: 35)
                        .foregroundColor(.addButtonColor)
                        .background(Color.addButtonAdditionalColor)
                        .clipShape(Circle())
                }
                .padding(.trailing, 4)
            }
            .padding(.leading, 10)
            .padding(.bottom, 7)
        }
    }
}

struct SaleGoodsCell_Previews: PreviewProvider {
    static var previews: some View {
        SaleGoodsCell(item: GoodsModel())
    }
}
