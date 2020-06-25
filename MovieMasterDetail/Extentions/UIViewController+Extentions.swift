//
//  UIViewController+Extention.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
   public  class func instanceXib<T: UIViewController>() -> T {
        return T(nibName: T.identifier, bundle: nil)
    }
    
    class func childViewController<T: UIViewController>(fromStoryBoard storyBoard: String) -> T{
        let storyboard = UIStoryboard(name: storyBoard, bundle: Bundle.main)
        // Instantiate View Controller
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue instantiate ViewController with identifier: \(T.identifier)")
        }
        return viewController
    }
 
}
