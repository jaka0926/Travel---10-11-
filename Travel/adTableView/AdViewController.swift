//
//  AdViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-29.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dismissButton: UIButton!
    
    var adTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = adTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 5
        titleLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        dismissButton.setTitle("뒤로 가기", for: .normal)
        
    }
    

    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
}
