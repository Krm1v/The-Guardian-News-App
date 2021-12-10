//
//  CollectionView + Extension + DataSource.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension NewsCollectionViewController {
    
override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return articles.count
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCell
    let article = articles[indexPath.item]
    cell.configureCell(with: article)

    return cell
    }
}
