//
//  Extension + NewsVC + Navigation.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension NewsCollectionViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                if segue.identifier == "toDetail" {
                    let detailVC = segue.destination as! DetailVC
                    detailVC.articleTitle = articles[indexPath.row].title ?? "No data"
                    detailVC.articleDescriptionText = articles[indexPath.row].description ?? "No data"
                    detailVC.content = articles[indexPath.row].content ?? "No data"
                    detailVC.image = articles[indexPath.row].urlToImage ?? "No data"
                }
            } else {
                // Error sender is not a cell or cell is not in collectionView.
        }
    }
}
