//
//  DetailViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-29.
//

import UIKit



class DetailViewController: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var popButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "관광지 화면"
        titleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        popButton.setTitle("뒤로 가기", for: .normal)
    }

    
    @IBAction func popButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
