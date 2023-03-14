//
//  ImagesCollection.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct ImagesCollection: View {
    @ObservedObject var viewModel: DetailGoodsViewModel
    
    var body: some View {
        VStack(spacing: 35) {
            TabView(selection: $viewModel.selectedImageUrl) {
                ForEach(viewModel.detailGoodsModel.imageURLS ?? [], id: \.self) { item in
                    AsyncImage(url: URL(string: item)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 328, height: 279)
                    .cornerRadius(10)
                    .tag(item)
                }
            }
            .frame(height: 279)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.trailing, 47)

            HStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center, spacing: 5) {
                        ForEach(viewModel.detailGoodsModel.imageURLS ?? [], id: \.self) { item in
                            
                            VStack {
                                Spacer()

                                let isSelected = viewModel.selectedImageUrl == item
                                let width: CGFloat = isSelected ? 83 : 65
                                let height: CGFloat = isSelected ? 45 : 37
                                let cornerRadius: CGFloat = isSelected ? 10 : 8
                                AsyncImage(url: URL(string: item)) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: width, height: height)
                                .cornerRadius(cornerRadius)
                                .overlay(
                                        RoundedRectangle(cornerRadius: cornerRadius)
                                            .stroke(isSelected ? .clear : .detailImageBorderColor, lineWidth: 1)
                                )
                                .shadow(color: isSelected ? Color.gray.opacity(0.7) : .clear, radius: 6, x: 0, y: 6)
                                .onTapGesture {
                                    viewModel.selectedImageUrl = item
                                }
                            }
                            .padding(.leading, 5)
                            .padding(.bottom, 24)
                        }
                    }
                }
                .frame(width: 242)
                .padding(.trailing, 5)
                .padding(.bottom, 4)
                .frame(height: 69)
                
                Spacer()
            }
        }
    }
}

struct ImagesCollection_Previews: PreviewProvider {
    static var previews: some View {
        ImagesCollection(viewModel: DetailGoodsViewModel())
    }
}
