//
//  NetworkManagerHelper.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getLatestGoods() async -> Result<LatestGoodsModel, Error> {
        return await doRequest(MultiTarget(GoodsEndpoint.latestGoods))
    }
    
    func getSaleGoods() async -> Result<FlashSaleGoodsModel, Error> {
        return await doRequest(MultiTarget(GoodsEndpoint.saleGoods))
    }
    
    func getDetailGoods() async -> Result<DetailGoodsModel, Error> {
        return await doRequest(MultiTarget(GoodsEndpoint.detailGoods))
    }
    
    func getSearchedGoods() async -> Result<SearchWordsModel, Error> {
        return await doRequest(MultiTarget(GoodsEndpoint.searchedGoods))
    }
}
