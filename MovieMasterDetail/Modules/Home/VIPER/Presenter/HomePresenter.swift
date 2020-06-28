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
    private var yearsSearch = [String]()
    
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
        setMoviesYears(items: movies)
        dataSource = MovieTableViewCellDataSource(delegate: self, tableView: self.view!.moviesTableView, items: movies)
    }
    
    func errorFetchingMovies(error: HomeConstant.HomeError) {
        // Show ERROR
        self.view?.showError(message: error.localizedDescription)
    }
    func search(str: String) {
        let movies = interactor?.search(str: str)
        dataSource = MovieTableViewCellDataSource(delegate: self, tableView: self.view!.moviesTableView, items: movies!)
    }
    
    func openYearsPicker(){
        if !self.yearsSearch.isEmpty  {
            router?.present(to: .YearPicker(delegate: self, years: self.yearsSearch))
        }
    }
    private func setMoviesYears(items:[Movie]) {
        var years = ["All"]
        for item in items {
            years.append(String(item.year!))
            
        }
        // Remove Duplicates
        let uniqueArrayValues = Array(Set(years))
        self.yearsSearch = uniqueArrayValues.sorted().reversed()
    }
    
}

extension HomePresenter:MovieTableViewCellDataSourceDelegate{
    func didSelected(movie:Movie) {
        // Move to Details Screen
        router?.navigate(to: .Details(movie: movie))
    }
    
}
extension HomePresenter:DatePickerDelegate {
    func didPickedUpYear(year: String) {
        if let year = Int(year) {
            let movies = interactor?.searchWithYear(year: year)
            dataSource = MovieTableViewCellDataSource(delegate: self, tableView: self.view!.moviesTableView, items: movies!)
            
        } else {
            // ALL
            dataSource = MovieTableViewCellDataSource(delegate: self, tableView: self.view!.moviesTableView, items: interactor!.movies)
            
        }
    }
    
}


protocol HomePresenterUseCases {
    func fetchMovies()
    func search(str:String)
    func openYearsPicker()
}


protocol HomePresenterDelegate {
    func didFetchMovies(movies:[Movie])
    func errorFetchingMovies(error:HomeConstant.HomeError)
}
