//
//  MovieTableViewCellDataSource.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit
class MovieTableViewCellDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    weak var delegate: MovieTableViewCellDataSourceDelegate!
    
    var tableView: UITableView!
    var items = [Movie]()
    
    init(delegate:MovieTableViewCellDataSourceDelegate,tableView:UITableView,items:[Movie]) {
        super.init()
        
        self.items = items
        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.selectionStyle = .none
        cell.setDetails(movie: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelected()
    }
    
    
    
}


protocol MovieTableViewCellDataSourceDelegate: class {
    func didSelected()
}
