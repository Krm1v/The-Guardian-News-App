//
//  DataManager.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 02.12.2021.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    func configureCell(with article: Articles) {
        
        DispatchQueue.main.async {
//            self.titleLabel.text = "\(article.title ?? "No data")"
//            self.authorLabel.text = "\(article.author)"
        }
    }
}
