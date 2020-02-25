//
//  HomeViewController.swift
//  APITest
//
//  Created by Anil on 25/02/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "TableCell")
        }
    }
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    //MARK: Private method
    func configureView() {
        self.title = "Home"
        fetchData()
    }
    
    
    //MARK: API call for fetching data
    func fetchData() {
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        
        cell.textLabel?.text = "Row #\(indexPath.row+1)"
        
        return cell
    }
    
    
}
