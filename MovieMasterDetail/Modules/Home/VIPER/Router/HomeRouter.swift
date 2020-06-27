//
//  HomeRouter.swift
//  MovieMasterDetail
//
//  Created Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Mena Gamal
//


import Foundation
import UIKit

class HomeRouter {
   enum Destination {
    case YearPicker(delegate:DatePickerDelegate,years:[String]),Details(movie:Movie),None
    }
    
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init() {
        
    }
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
     func root(to destination: HomeRouter.Destination) {
         let viewController = makeViewController(for: destination)
         navigationController?.viewControllers = [viewController]
     
         UIApplication.shared.keyWindow?.rootViewController = navigationController
     }
    
    func present(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.present(viewController, animated: true) {}
    }
    
    func detailViewController(movie:Movie) -> DetailViewController {
        let vc:DetailViewController = UIViewController.instanceXib()
        DetailBuilder().build(vc: vc, navigator: self.navigationController!, movie: movie)
        return vc
    }

    func openDatePicker(delegate:DatePickerDelegate,years:[String]) -> PopupDialog{
        let vc = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
        vc.config(delegate: delegate, years: years)
        
        return PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        
    }
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .Details(let movie):
            return detailViewController(movie: movie)
        case .None:
            return UIViewController()
        case .YearPicker(let delegate, let years):
            return openDatePicker(delegate: delegate, years: years)
        }
    }
}

