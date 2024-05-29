//
//  ViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-28.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    let list = TravelInfo.travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureView("도시 상세 정보")
        
    }
    
    func configureView(_ title: String) {
        navigationItem.title = title
        view.backgroundColor = .lightGray
    }
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
        
        let adXib = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: AdTableViewCell.identifier)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier) as! SampleTableViewCell
        
        let adCell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier) as! AdTableViewCell
        
        let data = list[indexPath.row]
        
        if data.ad == false {
            cell.configureCell(data)
            return cell
        }
        else {
            adCell.configureCell(data)
            return adCell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = list[indexPath.row]
        if data.ad {
            return 100
        } else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        if data.ad == false {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            present(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
