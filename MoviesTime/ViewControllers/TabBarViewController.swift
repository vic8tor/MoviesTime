//
//  TabBarViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Public Properties
    let movie: [Movie] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        selectVC()
    }
    // MARK: - Private methods
    private func selectVC() {
        guard let movieListVC = viewControllers?.first as? MovieListViewController else { return }
        movieListVC.movie = movie
    }
    
    
}
