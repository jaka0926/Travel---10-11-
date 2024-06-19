//
//  CityViewController.swift
//  Travel
//
//  Created by Jaka on 2024-06-01.
//

import UIKit

class CityViewController: UIViewController {

    
    @IBOutlet var searchField: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    
    var list = CityInfo.city
    var filteredList = CityInfo.city {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기 도시"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        searchField.returnKeyType = .search
        searchField.enablesReturnKeyAutomatically = true
        searchField.searchTextField.addTarget(self, action: #selector(searchButtonClicked), for: .editingDidEndOnExit)
        searchField.searchTextField.addTarget(self, action: #selector(performSearch), for: .editingChanged)
        
        segmentConfigure()
        
    }
    
    @objc func searchButtonClicked() {
        searchField.resignFirstResponder() // Dismiss the keyboard
        performSearch()
    }
    
    @objc func performSearch() {
        
        filterApplication()
        if searchField.text != "" {
            var data: [City] = []
            for item in filteredList{
                if "\(item.city_name) \(item.city_english_name.lowercased()) \(item.city_explain) ".contains(searchField.text!.lowercased()) {
                    data.append(item)
                }
            }
            filteredList = data
        }
    }
    
    func segmentConfigure() {
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: "모두", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "국내", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "해외", at: 2, animated: true)
        segmentControl.addTarget(self, action: #selector(filterApplication), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
    }
    
    @objc func filterApplication() {
        
        let segIndex = segmentControl.selectedSegmentIndex
        
        switch segIndex {
            case 0: displayAll()
            case 1: domesticFilter()
            case 2: internationalFilter()
            default: print("Switch Default")
        }
        
    }
    
    func displayAll() {
        filteredList = list
    }
    
    func domesticFilter() {
        
        var data: [City] = []
        for item in list {
            if item.domestic_travel {
                data.append(item)
            }
        }
        filteredList = data
    }
    
    func internationalFilter() {
        
        var data: [City] = []
        for item in list {
            if !item.domestic_travel {
                data.append(item)
            }
        }
        filteredList = data
    }
}


extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        let data = filteredList[indexPath.row]
        cell.configureCell(data)
        
        return cell
    }
}
