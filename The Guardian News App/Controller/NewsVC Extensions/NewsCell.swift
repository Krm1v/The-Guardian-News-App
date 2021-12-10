//
//  DataManager.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 02.12.2021.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
//MARK: - @IBOutlets
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    func configureCell(with article: Articles) {
        
        DispatchQueue.main.async {
            self.titleLabel.text = article.title
            self.sourceLabel.text = article.source.name
            self.authorLabel.text = article.author
        }
    }
}
