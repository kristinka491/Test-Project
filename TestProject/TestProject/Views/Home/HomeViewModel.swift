//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var latestGoodsModels: [GoodsModel] = []
    @Published var saleGoodsModels: [GoodsModel] = []
    @Published var hintsText: [String] = []
    
    let categories = CategoryEnum.allCases
    private let networkManager = NetworkManager.shared
    private var publishers = Set<AnyCancellable>()
    
    init() {
        setUpObserbables()
    }
    
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
    
    private func setUpObserbables() {
        $searchText
            .removeDuplicates()
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { search in
                if !search.isEmpty {
                    Task {
                        await self.getHintsText(with: search)
                    }
                } else {
                    self.hintsText = []
                }
            })
            .store(in: &publishers)
        
        $searchText
            .sink(receiveValue: { search in
                if search.isEmpty {
                    self.hintsText = []
                }
            })
            .store(in: &publishers)
    }
    
    @MainActor private func getHintsText(with search: String) async {
        let searchModel = await self.networkManager.getSearchedGoods() // no global actor attribute
        switch searchModel {
        case .success(let model):
            hintsText = model.words?.filter { $0.contains(search) } ?? []
        case .failure(let error):
            hintsText = []
            debugPrint(error.localizedDescription)
        }
    }
}
