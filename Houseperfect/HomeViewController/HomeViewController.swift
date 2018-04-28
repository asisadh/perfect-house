//
//  ViewController.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: HomeViewControllerViewModel = HomeViewControllerViewModel()
    
    private let identifier = "HomeTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel =
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = viewModel.numberOfSections(){
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! HomeTableViewCell
        
        if let cellData = viewModel.cellForRowAtIndexPath(row: indexPath.section){
            cell.initCellView(data: cellData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(row: indexPath.row)
    }
}

