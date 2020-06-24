//
//  HomePresenter.swift
//  MovieMasterDetail
//
//  Created Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Mena Gamal
//

import UIKit

class HomePresenter: HomePresenterUseCases,HomePresenterDelegate {
    
    //MARK: Dependacnies
    private var interactor:HomeInteractor?
    private var router:HomeRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:HomeView?
    
    //MARK: Attributes
    private var dataSource:MovieTableViewCellDataSource?
    
    init(interactor:HomeInteractor,router:HomeRouter,view:HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func fetchMovies() {
        interactor?.parseMoviesFromLocalFile()
    }
    func didFetchMovies(movies: [Movie]) {
        // Load DataSource
        dataSource = MovieTableViewCellDataSource(delegate: self, tableView: self.view!.moviesTableView, items: movies)
    }
    
    func errorFetchingMovies(error: HomeConstant.HomeError) {
        // Show ERROR
    }
    
}

extension HomePresenter:MovieTableViewCellDataSourceDelegate{
    func didSelected() {
        // Move to Details Screen
        router?.navigate(to: .None)
    }
    
    
}


protocol HomePresenterUseCases {
    func fetchMovies()
}


protocol HomePresenterDelegate {
    func didFetchMovies(movies:[Movie])
    func errorFetchingMovies(error:HomeConstant.HomeError)
}
