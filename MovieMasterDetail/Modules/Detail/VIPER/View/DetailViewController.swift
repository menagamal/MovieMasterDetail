//
//  DetailViewController.swift
//  MovieMasterDetail
//
//  Created Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Mena Gamal
//

import UIKit
import Cosmos

class DetailViewController: UIViewController, DetailView {
  
	var presenter: DetailPresenter?

    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var photosCollection: UICollectionView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelGeners: UILabel!
    @IBOutlet weak var labelCast: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.tintColor = UIColor(hexString: "#FF0E5E")
        
        
        presenter?.loadDetails()
        presenter?.loadPhotos()
    }
    func showError(message: String) {
        Toast.showAlert(viewController: self, text: message, style: .alert, UIAlertAction(title: "Okay", style: .default, handler: { (_) in

            let _ = self.navigationController?.popViewController(animated: true)
        }))
        
      }
      


}
