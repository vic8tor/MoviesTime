//
//  ViewController.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - @IBOutlets
    
    @IBOutlet weak var wideImage: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var genreMovieLabel: UILabel!
    @IBOutlet weak var raitingMovieLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    // MARK: - Public Properties
    var movie: Movie!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        wideImage.image = UIImage(named: movie.imageWide)
        titleMovieLabel.text = movie.name
        genreMovieLabel.text = movie.genre
        raitingMovieLabel.text = "⭐️ " + String(round(10 * movie.raiting) / 10)
        summaryTextView.text = movie.desctiption
    }

    
    // MARK: - @IBActions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods


}

