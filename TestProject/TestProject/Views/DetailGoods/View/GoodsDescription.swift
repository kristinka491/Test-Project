//
//  GoodsDescription.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct GoodsDescription: View {
    var detailGoodsModel: DetailGoods
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(detailGoodsModel.name ?? "")
                    .font(.montserrat(.bold, size: 18))
                    .foregroundColor(.headerColor)
                
                Spacer()
                
                Text(detailGoodsModel.priceString)
                    .font(.montserrat(.bold, size: 12))
                    .foregroundColor(.headerColor)
            }
            .padding(.bottom, 16)
            .padding(.trailing, 24)
            
            
            HStack(spacing: 0) {
                Text(detailGoodsModel.description ?? "")
                    .font(.montserrat(.regular, size: 12))
                    .foregroundColor(.additionalTextColor)
                    .padding(.trailing, 156)
                    .padding(.bottom, 14)
                Spacer()
            }
            
            
            HStack(spacing: 0) {
                Image("Star")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 4)
                
                Text(detailGoodsModel.ratingString)
                    .font(.montserrat(.bold, size: 10))
                    .foregroundColor(.headerColor)
                    .padding(.trailing, 4)
                
                Text(detailGoodsModel.numberOfReviewsString)
                    .font(.montserrat(.regular, size: 12))
                    .foregroundColor(.additionalTextColor)
                Spacer()
            }
            
            HStack(spacing: 0) {
                Text(StringConstants.detailGoodsColor)
                    .font(.montserrat(.bold, size: 12))
                    .foregroundColor(.detailViewAdditionalColor)
                    .padding(.top, 17)
                Spacer()
            }.padding(.bottom, 13)
            
            HStack(spacing: 0) {
                ForEach(detailGoodsModel.colors ?? [], id: \.self) { item in
                    if item == "#ffffff" {
                        Color.hexStringToColor(hex: item)
                            .frame(width: 32, height: 24)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.borderColor, lineWidth: 2)
                                )
                    } else {
                        Color.hexStringToColor(hex: item)
                            .frame(width: 32, height: 24)
                            .cornerRadius(10)
                    }
                }.padding(.trailing, 15)
                Spacer()
            }
        }
        .padding(.leading, 25)
    }
}

struct GoodsDescription_Previews: PreviewProvider {
    static var previews: some View {
        GoodsDescription(detailGoodsModel: DetailGoods())
    }
}
