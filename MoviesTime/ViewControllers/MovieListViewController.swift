//
//  MovieListViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Alamofire
import UIKit

class MovieListViewController: UITableViewController {
    // MARK: - Public Properties
    var movies = [Movie]()
    
    // MARK: - Private Properties

    // MARK: - Override Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as! CustomTableViewCell
        let moviesOnCell = movies[indexPath.row]
        cell.configure(with: moviesOnCell)
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow?.row else { return }
    
        let movies = movies[indexPath]
        detailVC.movies = movies
    }
    // MARK: - Public Methods
    func fetchFilms() {
        NetworkingManager.shared.fetchData(from: Url.moviesTB.rawValue) { result in
            switch result {
            case .success(let moviesList):
                self.movies = moviesList.movies
                self.tableView.reloadData()
            case .failure(let error):
                print("Error processing JSON data: \(error)")
            }
        }
    }
    
    func fetchDataWithAlamofire() {
        AF.request(Url.moviesTB.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.movies = Movie.getMovie(from: value)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
    
    
}

