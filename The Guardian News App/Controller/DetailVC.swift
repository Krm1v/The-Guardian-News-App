//
//  DetailViewController.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 04.12.2021.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var articleLabel: UILabel!
    
    @IBOutlet var articleImage: UIImageView!
    @IBOutlet var articleDescription: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
//    var imageURL: Articles?
    var articleTitle = ""
    var articleDescriptionText = ""
    var content = ""
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage(with: image)
        articleLabel.text = articleTitle
        articleDescription.text = articleDescriptionText
        contentLabel.text = content
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
       
    }
    
    override func viewDidLayoutSubviews() {
        contentLabel.sizeToFit()
    }

//MARK: - Fetch Image
    func fetchImage(with url: String) {
        guard let url = URL(string: image) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
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
    
//    private func setTitleText() {
//        contentLabel.frame = CGRect(x: 20, y: 20, width: 374, height: 291.2)
//        contentLabel.backgroundColor = UIColor.clear //set a light color to see the frame
//        contentLabel.textAlignment = .left
//        contentLabel.lineBreakMode = .byTruncatingTail
//        contentLabel.numberOfLines = 0
//        contentLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
//        contentLabel.text = "Example"
//        contentLabel.sizeToFit()
//        self.view.addSubview(contentLabel)
//    }
    
}
