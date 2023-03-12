//
//  GoodsEndpoint.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation
import Moya

enum GoodsEndpoint {
    case latestGoods
    case saleGoods
    case detailGoods
    case searchedGoods
}

extension GoodsEndpoint: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://run.mocky.io/v3") else {
            fatalError()
        }
        return url
    }

    var path: String {
        switch self {
        case .latestGoods:
            return "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .saleGoods:
            return "a9ceeb6e-416d-4352-bde6-2203416576ac"
        case .detailGoods:
            return "f7f99d04-4971-45d5-92e0-70333383c239"
        case .searchedGoods:
            return "4c9cd822-9479-4509-803d-63197e5a9e19"
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var sampleData: Data {
        return Data()
    }
}
