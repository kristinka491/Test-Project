//
//  DetailGoodsView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct DetailGoodsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = DetailGoodsViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundColor
            GeometryReader { reader in
                Color.backgroundColor
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 2) {
                HStack(spacing: 0) {
                    Image("ArrowBack")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 29, height: 12)
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        LargeImagesCollection(imageURLS: viewModel.detailGoodsModel.imageURLS ?? [])
                        
                        SmallImagesCollection(imageURLS: viewModel.detailGoodsModel.imageURLS ?? [])
                        
                        GoodsDescription(detailGoodsModel: viewModel.detailGoodsModel)
                    }
                }
                
                AddToCartView(viewModel: viewModel)
            }
            ButtonsControlView()

        }
        .toolbar(.hidden)
        .onAppear() {
            viewModel.getGoodsDetail()
        }
    }
}

struct DetailGoodsView_Previews: PreviewProvider {
    @State private var showingDetail = false
    static var previews: some View {
        DetailGoodsView()
    }
}

