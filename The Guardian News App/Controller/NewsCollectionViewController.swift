//
//  NewsCollectionViewController.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 01.12.2021.
//

import UIKit

class NewsCollectionViewController: UICollectionViewController {
    
    private let url = "https://newsapi.org/v2/everything?q=Apple&from=2021-12-02&sortBy=popularity&apiKey=a7962c140593469a91318f5ae95dea7c"
    var articles = [Articles]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
// MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCell
        let article = articles[indexPath.item]
        cell.configureCell(with: article)
    
        return cell
    }

//MARK: - CollectionView Delegate Methods
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            performSegue(withIdentifier: "toDetail", sender: cell)
        } else {
            //Error
        }
    }
    
    @IBAction func updateButtonPressed(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.parseJSON()
        }
        collectionView.reloadData()
    }
    
//MARK: - JSON parsing

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
                print(self.articles.count)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    

//MARK: - Navigation
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
