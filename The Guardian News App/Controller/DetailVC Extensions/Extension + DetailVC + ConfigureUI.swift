//
//  Extension + DetailVC + ConfigureUI.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 10.12.2021.
//

import UIKit

extension DetailVC {
    func configureUI() {
        articleLabel.text = articleTitle
        articleDescription.text = articleDescriptionText
        contentLabel.text = content
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
}
