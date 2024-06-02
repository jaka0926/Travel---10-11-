//
//  CityTableViewCell.swift
//  Travel
//
//  Created by Jaka on 2024-06-01.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var imageMask: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    static let identifier = "CityTableViewCell"
    lazy var list = [posterImage, imageMask]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for element in list {
            
            element!.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
            element!.layer.cornerRadius = 30
            element!.clipsToBounds = true
        }
        
        posterImage.contentMode = .scaleAspectFill
        imageMask.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        titleLabel.font = .systemFont(ofSize: 23, weight: .heavy)
        titleLabel.textColor = .white
        
        descLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        descLabel.textColor = .white
        
    }
    

    
    func configureCell(_ data: City) {
        let url = URL(string: data.city_image)
        posterImage.kf.setImage(with: url)
        titleLabel.text = "\(data.city_name) | \(data.city_english_name)"
        descLabel.text = "  \(data.city_explain)"
    }

    
}


