//
//  DetailViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-29.
//

import UIKit
import Kingfisher


class DetailViewController: UIViewController {

    
    var navTitle = ""
    var image = ""
    var desc = ""
    var rating = ""
    var saveCount = ""
    var url = ""
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    
    @IBOutlet var labelBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = navTitle
        posterImage.kf.setImage(with: URL(string: url))
        posterImage.contentMode = .scaleAspectFill
        descLabel.text = desc
        descLabel.numberOfLines = 3
        descLabel.font = .boldSystemFont(ofSize: 20)
        ratingLabel.text = rating
        saveLabel.text = saveCount
        labelBg.layer.borderWidth = 1

    }
    
}
