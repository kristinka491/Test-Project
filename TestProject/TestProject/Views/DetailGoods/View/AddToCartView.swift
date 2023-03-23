//
//  AddToCartView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct AddToCartView: View {
    @ObservedObject var viewModel: DetailGoodsViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(StringConstants.detailGoodsQuantity)
                        .font(.montserrat(.regular, size: 10))
                        .foregroundColor(.additionalTextColor)
                    
                    HStack(spacing: 8) {
                        CartButtonView(imageName: "minus")
                            .onTapGesture {
                                if viewModel.counterValue > 0 {
                                    viewModel.counterValue -= 1
                                }
                            }
                        
                        Text("\(viewModel.counterValue)")
                            .font(.montserrat(.bold, size: 10))
                            .foregroundColor(.white)
                        
                        CartButtonView(imageName: "plus")
                            .onTapGesture {
                                viewModel.counterValue += 1
                            }
                    }
                }
                .padding(.leading, 24)
                
                HStack(spacing: 0) {
                    Text(viewModel.totalPrice)
                        .font(.montserrat(.regular, size: 10))
                        .foregroundColor(.addToCartTitleColor)
                        .padding(.leading, 30)
                    
                    Spacer(minLength: 8)
                    
                    Text(StringConstants.detailGoodsAddToCartButtonTitle)
                        .font(.montserrat(.bold, size: 10))
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .padding([.top,.bottom], 19)
                        .padding(.trailing, 31)
                }
                .frame(maxWidth: .infinity)
                .background(Color.buttonBackgroundColor)
                .cornerRadius(20)
                .padding(.trailing, 23)
            }
            VStack() {
                Spacer()
            }
            .frame(height: 79)
        }
        .frame(height: 170)
            .frame(maxWidth: .infinity)
            .background(Color.viewBackground)
            .cornerRadius(27, corners: [.topLeft, .topRight])
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView(viewModel: DetailGoodsViewModel())
    }
}
