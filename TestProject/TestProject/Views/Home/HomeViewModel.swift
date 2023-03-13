//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var latestGoodsModels: [GoodsModel] = []
    @Published var saleGoodsModels: [GoodsModel] = []
    
    let categories = CategoryEnum.allCases
    private let networkManager = NetworkManager.shared
    
    func getAllGoods() {
        Task { @MainActor in
            async let latestGoods = networkManager.getLatestGoods()
            async let saleGoods = networkManager.getSaleGoods()
            let values = await (latestGoods, saleGoods)
            
            switch values.0 {
            case .success(let model):
                latestGoodsModels = model.latest ?? []
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
    
            switch values.1 {
            case .success(let model):
                saleGoodsModels = model.flashSale ?? []
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
