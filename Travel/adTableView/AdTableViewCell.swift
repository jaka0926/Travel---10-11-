//
//  AdTableViewCell.swift
//  Travel
//
//  Created by Jaka on 2024-05-28.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    static let identifier = "AdTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 15
        
        titleLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        
        adLabel.text = "AD"
        adLabel.backgroundColor = .systemGray6
        adLabel.layer.cornerRadius = 5
        adLabel.layer.masksToBounds = true
        
    }

    func configureCell(_ data: Travel) {
        titleLabel.text = data.title
        backgroundColor = .none
        bgView.backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor {
            let red = CGFloat(arc4random_uniform(256)) / 255.0
            let green = CGFloat(arc4random_uniform(256)) / 255.0
            let blue = CGFloat(arc4random_uniform(256)) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
}
