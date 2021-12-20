//
//  ImageView.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 20.12.2021.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(with url: String?) {
        
        guard let url = url else { return }
        guard let imageUrl = url.getUrl() else {
            image = #imageLiteral(resourceName: "placeholder")
            return
        }
        
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            guard let response = response else { return }
            guard let responseUrl = response.url else { return }
            if responseUrl.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            self.cacheImage(data: data, response: response)
        }.resume()
    }
    
    private func cacheImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
    }
}

fileprivate extension String {
    
    func getUrl() -> URL? {
        
        guard let url = URL(string: self) else { return nil }
        return url
    }
}
