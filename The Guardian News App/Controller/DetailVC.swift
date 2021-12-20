//
//  DetailViewController.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 04.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
//MARK: - @IBOutlets
    @IBOutlet var articleLabel: UILabel!
    @IBOutlet var articleImage: UIImageView!
    @IBOutlet var articleDescription: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Properties
    var articleTitle = ""
    var articleDescriptionText = ""
    var content = ""
    var image = ""
    
//MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage(with: image)
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        contentLabel.sizeToFit()
    }
    
    @IBAction func favoritesButton(_ sender: UIBarButtonItem) {
    }
    
}

