//
//  RestaurantViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-29.
//

import UIKit


class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = RestaurantList.restaurantArray
    lazy var filteredList = list
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var koreanFoodButton: UIButton!
    @IBOutlet var cheapFoodButton: UIButton!
    
    @IBOutlet var mapButton: UIButton!
    
    var koreanFilterOn = false
    var cheapFilterOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        configureTableView()
        navigationItem.title = "맛집 목록"
        
        koreanFoodButton.setTitle("한식만 보기", for: .normal)
        koreanFoodButton.tintColor = .black
        koreanFoodButton.layer.cornerRadius = 5
        cheapFoodButton.setTitle("만원 이하 음식", for: .normal)
        cheapFoodButton.tintColor = .black
        cheapFoodButton.layer.cornerRadius = 5
        mapButton.setTitle("지도 위치", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier) as! RestaurantTableViewCell
        
        let data = filteredList[indexPath.row]
        
        
        
        cell.configureCell(data)
        
        return cell
    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: RestaurantTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
    }
    
    
    @IBAction func koreanFoodButtonClicked(_ sender: UIButton) {
        koreanFilterOn.toggle()
        koreanFoodButton.backgroundColor = koreanFilterOn ? .darkGray : .white
        koreanFoodButton.tintColor = koreanFilterOn ? .white : .black
        
        var koreanFoodList:[Restaurant] = []
        if koreanFilterOn {
            for item in list {
                if item.category == "한식" {
                    koreanFoodList.append(item)
                }
            }
        } else {
            koreanFoodList = list
        }
        
        filteredList = koreanFoodList
        tableView.reloadData()
    }
    
    @IBAction func cheapFoodButtonClicked(_ sender: UIButton) {
        cheapFilterOn.toggle()
        cheapFoodButton.backgroundColor = cheapFilterOn ? .darkGray : .white
        cheapFoodButton.tintColor = cheapFilterOn ? .white : .black
        
        var cheapFoodList:[Restaurant] = []
        if cheapFilterOn {
            for item in list {
                if item.price <= 10000 {
                    cheapFoodList.append(item)
                }
            }
        } else {
            cheapFoodList = list
        }
        
        filteredList = cheapFoodList
        tableView.reloadData()
    }
    
}
