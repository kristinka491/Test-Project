//
//  HomeView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                GeometryReader { reader in
                    Color.backgroundColor
                        .frame(height: reader.safeAreaInsets.top, alignment: .top)
                        .ignoresSafeArea()
                }
                
                VStack(spacing: 0) {
                    HomeNavigationView()
                    
                    HStack(spacing: 0) {
                        TextField(StringConstants.homeSearchPlaceholder, text: $viewModel.searchText)
                            .multilineTextAlignment(.center)
                            .frame(height: 24)
                            .font(.montserrat(.regular, size: 10))
                            .foregroundColor(.homeTextColor)
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.homeTextColor)
                            .padding(.trailing, 19)
                    }
                    .background(Color.homeTextFieldColor)
                    .cornerRadius(20)
                    .padding(.leading, 56)
                    .padding(.trailing, 57)
                    .padding(.bottom, 17)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 9) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 21) {
                                    ForEach(viewModel.categories, id: \.title) { item in
                                        CategoryCell(item: item)
                                    }
                                }
                                .frame(height: 65)
                                .padding(.leading, 4)
                                .padding(.trailing, 15)
                                .padding(.bottom, 28)
                            }
                            
                            HeaderView(title: StringConstants.homeLatest)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 12) {
                                    ForEach(viewModel.latestGoodsModels, id: \.name) { item in
                                        LatestGoodsCell(item: item)
                                    }
                                }
                            }
                            
                            HeaderView(title: StringConstants.homeFlashSale)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 12) {
                                    ForEach(viewModel.saleGoodsModels, id: \.name) { item in
                                        NavigationLink(destination: DetailGoodsView()) {
                                            SaleGoodsCell(item: item)
                                        }
                                    }
                                }
                            }
                            
                            HeaderView(title: StringConstants.homeBrands)
                            
                            Text(StringConstants.mockTitle)
                                .font(.montserrat(.bold, size: 20))
                                .padding(.top, 20)
                        }
                    }
                    .padding(.leading, 11)
                    Spacer()
                }
                .padding(.bottom, 63)
                
                VStack(spacing: 0) {
                    ForEach(viewModel.hintsText, id: \.self) { item in
                        Text(item)
                            .font(.montserrat(.regular, size: 12))
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                                
                        if item != viewModel.hintsText.last {
                            Divider()
                                .frame(height: 5)
                                .background(Color.white)
                        }
                    }
                    
                    Spacer ()
                }
                .padding([.leading, .trailing], 32)
                .padding(.top, 89)
                .opacity(viewModel.hintsText.isEmpty ? 0 : 1)
            }
        }
        .onTapGesture {
            viewModel.hintsText = []
        }
        .onAppear() {
            viewModel.getAllGoods()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
