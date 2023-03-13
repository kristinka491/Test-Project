//
//  NetworkManager.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-12.
//

import Foundation
import Moya

class NetworkManager {
    static let shared = NetworkManager()
    
    func doRequest<T: Decodable>(_ target: MultiTarget) async -> Result<T, Error> {
        return await withCheckedContinuation { continuation in
            doRequest(target: target) { result in
                    continuation.resume(returning: result)
                }
            }
    }
    
    private func doRequest<T: Decodable>(target: MultiTarget,
                                         completion: ((Result<T, Error>) -> Void)?) {
        let provider = MoyaProvider<MultiTarget>()
        
        provider.request(target) { [weak self] result in
            switch result {
            case .success(let response):
                debugPrint(response.request ?? "Can't unwrap")
                debugPrint(response.request?.allHTTPHeaderFields ?? "Can't unwrap")
                debugPrint(response.response ?? "Can't unwrap")

                let jsonData = try? JSONSerialization.jsonObject(with: response.data)
                let json: Any? = jsonData as? [String: Any] ?? jsonData as? [Any] ?? nil

                let expected: (T?, Error?)? = self?.model(from: json)
                guard let models = expected?.0 else {
                    completion?(.failure(expected?.1 ?? NSError(domain: "Parsing Error", code: 400)))
                    return
                }
                completion?(.success(models))
            case .failure(let error):
                debugPrint(error)
                completion?(.failure(error))
            }
        }
    }
    
    private func model<T>(from payload: Any?) -> (T?, Error?) where T: Decodable {
        let decoder = JSONDecoder()
        do {
            guard let payload =  payload else {
                return (nil, nil)
            }
            
            let json = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
            let model = try decoder.decode(T.self, from: json)
            return (model, nil)
        } catch let error {
            debugPrint("\n Error JSON data: \(error)")
            return (nil, error)
        }
    }
}
