//
//  DetailGoodsViewModel.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import Foundation
import Combine

class DetailGoodsViewModel: ObservableObject, PriceFormatter {
    @Published var detailGoodsModel = DetailGoods()
    @Published var counterValue: Int = 0
    @Published var totalPrice: String = "$ 0"

    private let networkManager = NetworkManager.shared
    private var publishers = Set<AnyCancellable>()

    init() {
        $counterValue
            .map { [weak self] counter in
                return self?.priceString(price: (self?.detailGoodsModel.price ?? 0.0) * Double(counter)) ?? ""
            }
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: \.totalPrice, on: self)
            .store(in: &publishers)
    }
    
    func getGoodsDetail() {
        Task { @MainActor in
            let detailsModel =  await networkManager.getDetailGoods()
            
            switch detailsModel {
            case .success(let model):
                detailGoodsModel = model
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
