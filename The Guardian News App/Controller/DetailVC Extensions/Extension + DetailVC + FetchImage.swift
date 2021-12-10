//
//  DetailVC + Extension + ConfigureUI.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension DetailVC {

    func fetchImage(with url: String) {
        guard let url = URL(string: image) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if response != nil {
            }
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.articleImage.image = image
                }
            }
        }.resume()
    }
}
