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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "광고 화면"
        titleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        dismissButton.setTitle("뒤로 가기", for: .normal)
        
        
    }
    

    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
}
