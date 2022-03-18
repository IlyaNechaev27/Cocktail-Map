//
//  CocktailImageView.swift
//  Cocktail Map
//
//  Created by Илья Нечаев on 18.03.2022.
//

import Foundation
import UIKit

class CocktailImageView: UIImageView {
    
    func fetchImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = getCachedImage(with: url) {
            image = cachedImage
            return
        }
        
        NetworkManager.shared.fetchImage(with: url) { data, response in
            self.image = UIImage(data: data)
            self.cacheImageData(with: data, and: response)
        }
    }
    
    private func getCachedImage(with url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    private func cacheImageData(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
}
