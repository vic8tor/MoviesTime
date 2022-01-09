//
//  RandomMovieViewController.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 9.01.22.
//

import UIKit

class RandomMovieViewController: UIViewController {

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
        raitingMovieLabel.text = "⭐️ " + movie.raiting
        summaryTextView.text = movie.desctiption
    }
}
