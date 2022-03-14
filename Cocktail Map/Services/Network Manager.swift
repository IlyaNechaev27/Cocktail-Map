//
//  Network Manager.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL, noData, decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(for type: T.Type, from urlString: String, completion: @escaping (Result<T,NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(with url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        
        return try? Data(contentsOf: imageURL)
    }
}

class AlamofireNetworkManager {
    static let shared = AlamofireNetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(type: T.Type, with urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: T.self) { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        completion(.success(value))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
        }
    }
}

