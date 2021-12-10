//
//  NewsCollectionViewController.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 01.12.2021.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {
    
//MARK: - Properties
    
    let url = "https://newsapi.org/v2/everything?q=Apple&from=2021-12-02&sortBy=popularity&apiKey=a7962c140593469a91318f5ae95dea7c"
    var articles = [Articles]()
        
//MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }

//MARK: - @IBActions
    
    @IBAction func updateButtonPressed(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.parseJSON()
        }
        collectionView.reloadData()
    }
}
