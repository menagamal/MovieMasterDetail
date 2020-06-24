//
//  DetailPresenter.swift
//  MovieMasterDetail
//
//  Created Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Mena Gamal
//

import UIKit

class DetailPresenter: DetailPresenterDelegate {
	    
    private var interactor:DetailInteractor?
    private var router:DetailRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:DetailView?

    
    init(interactor:DetailInteractor,router:DetailRouter,view:DetailView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    

}
protocol DetailPresenterDelegate {

}
