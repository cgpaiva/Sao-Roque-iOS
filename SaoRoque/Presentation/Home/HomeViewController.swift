//
//  HomeViewController.swift
//  SaoRoque
//
//  Created by Gabriel on 05/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        let homeView = HomeView()
        homeView.backgroundColor = .cyan
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
        
}
