//
//  SampleTableViewCell.swift
//  Travel
//
//  Created by Jaka on 2024-05-28.
//

import UIKit
import Kingfisher


class SampleTableViewCell: UITableViewCell {

    static let identifier = "SampleTableViewCell"
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.font = .boldSystemFont(ofSize: 20)
        contentLabel.numberOfLines = 1
        contentLabel.textColor = .black
        
        descLabel.font = .systemFont(ofSize: 15)
        descLabel.textColor = .darkGray
        descLabel.numberOfLines = 4
        gradeLabel.font = .systemFont(ofSize: 14)
        gradeLabel.textColor = .lightGray
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 10
        
        likeButton.tintColor = .white
        
        
    }

    func configureCell(_ data: Travel) {
        
        contentLabel.text = data.title
        backgroundColor = .white
        let url = URL(string: data.travel_image!)
        posterImage.kf.setImage(with: url)
        descLabel.text = data.description
        gradeLabel.text = "\(data.grade!) | 저장 \(data.save!.formatted())"
                    
    }
}
    
