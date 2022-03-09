//
//  Network Manager.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 09.03.2022.
//

import Foundation

enum Link: String {
    case cocktails = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
}

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
}
