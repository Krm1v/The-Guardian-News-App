//
//  Extension + StartVC + Navigation.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension StartViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsVC" {
        let destinationVC = segue.destination as? NewsCollectionViewController
            DispatchQueue.global().async {
                destinationVC?.parseJSON()
               
            }
        }
    }
}
