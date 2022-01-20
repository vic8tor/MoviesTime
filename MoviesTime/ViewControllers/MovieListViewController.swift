//
//  MovieListViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Alamofire
import UIKit

class MovieListViewController: UITableViewController {
    //MARK: - @IBOUTLETS
    
    @IBOutlet weak var NextButton: UIBarButtonItem!
    @IBOutlet weak var PreviousButton: UIBarButtonItem!
    
    // MARK: - Public Properties
    var movies = [Movie]()
    
    // MARK: - Private Properties
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredMovies: [Movie] = []
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredMovies.count : movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as! CustomTableViewCell
        
        let movies = isFiltering ? filteredMovies[indexPath.row] : movies[indexPath.row]
        cell.configure(with: movies)
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow?.row else { return }
    
        let movies = isFiltering ? filteredMovies[indexPath] : movies[indexPath]
        detailVC.movies = movies
    }
    //MARK: - @IBActions
    
//    @IBAction func turnThePage(_ sender: UIBarButtonItem) {
//        sender.tag == 0 ?
//    }
    
    
    // MARK: - Public Methods
    func fetchFilms() {
        NetworkingManager.shared.fetchData(from: Link.moviesTB.rawValue) { result in
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
        AF.request(Link.moviesTB.rawValue)
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
    
    //MARK: - Private Methods
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.barStyle = .black
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
   
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ seacrhText: String) {
        filteredMovies = movies.filter { (movie: Movie) -> Bool in
            movie.title?.lowercased().contains(seacrhText.lowercased()) ?? false
        }
        tableView.reloadData()
    }
}
    

