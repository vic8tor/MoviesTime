//
//  MovieListViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import UIKit

class MovieListViewController: UITableViewController {
    // MARK: - @IBOutlets
    
    // MARK: - Public Properties
    var movie: [Movie] = []
    
    // MARK: - Private Properties

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBActions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as! CustomTableViewCell
    
        cell.titleLabel.text = movie[indexPath.row].name
        cell.genreLabel.text = movie[indexPath.row].genre
        
        cell.summaryLabel.text = movie[indexPath.row].desctiption
        
        cell.imageOfMovies.image = UIImage(named: movie[indexPath.row].imageSmall)
        
        cell.raitingLabel.text = String(round(10 * movie[indexPath.row].raiting) / 10)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow?.row else { return }
        let movies = movie[indexPath]
        detailVC.movie = movies
    }
   
    
    
}
