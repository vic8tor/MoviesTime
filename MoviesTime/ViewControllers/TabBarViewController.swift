//
//  TabBarViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Public Properties
    let Movies = Movie.getMovie()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
