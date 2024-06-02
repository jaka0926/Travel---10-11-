//
//  RestaurantTableViewCell.swift
//  Travel
//
//  Created by Jaka on 2024-05-29.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    
    static let identifier = "RestaurantTableViewCell"
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var categoryLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImage.contentMode = .scaleAspectFill
        nameLabel.font = .boldSystemFont(ofSize: 17)
        addLabel.font = .systemFont(ofSize: 14)
        addLabel.textColor = .darkGray
        phoneLabel.font = .systemFont(ofSize: 12)
        priceLabel.font = .boldSystemFont(ofSize: 15)
        
    }
        
    func configureCell(_ data: Restaurant) {
        
        let url = URL(string: data.image)
        
        backgroundColor = .systemGray6
        posterImage.kf.setImage(with: url)
        posterImage.layer.cornerRadius = 10
        nameLabel.text = data.name
        addLabel.text = data.address
        addLabel.numberOfLines = 2
        phoneLabel.text = "\(data.phoneNumber)"
        priceLabel.text = "₩ \(data.price.formatted())"
        categoryLabel.text = data.category
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .black
        
    }
    
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        
    }
}
