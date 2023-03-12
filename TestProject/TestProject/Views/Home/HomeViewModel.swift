//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var latestGoodsModels: [GoodsModel] = [GoodsModel(category: "Phones", name: "Samsung S10", price: 1000, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"), GoodsModel(category: "Phones", name: "Samsung S11", price: 1000, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"), GoodsModel(category: "Phones", name: "Samsung S10", price: 1000, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg")]
    @Published var saleGoodsModels: [GoodsModel] = [GoodsModel(category: "Phones", name: "Samsung S10", price: 1000, discount: 30, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"), GoodsModel(category: "Phones", name: "Samsung S11", price: 1000, discount: 30, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"), GoodsModel(category: "Phones", name: "Samsung S10", price: 1000, discount: 30, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg")]
    let categories = CategoryEnum.allCases
    
//    init() {
//        categories = CategoryEnum.allCases
//    }
}
