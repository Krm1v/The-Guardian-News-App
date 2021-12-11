//
//  Extension + NewsVC + JSON Parse.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension NewsCollectionViewController {

    func parseJSON() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
        
            do {
                let newsFeed = try JSONDecoder().decode(NewsFeed.self, from: data)
                self.articles = newsFeed.articles
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
