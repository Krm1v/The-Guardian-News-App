//
//  ViewController.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 01.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsVC" {
        let destinationVC = segue.destination as? NewsCollectionViewController
        destinationVC?.parseJSON()
        }
    }
}


