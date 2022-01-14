//
//  MovieListViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import UIKit

class MovieListViewController: UITableViewController {
    // MARK: - Public Properties
    var movies = [Movie]()
    
    // MARK: - Private Properties

    // MARK: - Override Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(movies)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movies)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as! CustomTableViewCell
        let moviesOnCell = movies[indexPath.row]
        cell.configure(with: moviesOnCell)
        
        return cell
    }
   
    // MARK: - @IBActions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods

    // MARK: - Table view data source


    
    
}
