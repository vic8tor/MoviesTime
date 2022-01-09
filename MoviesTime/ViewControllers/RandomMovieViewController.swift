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
    var movie: [Movie] = []
    private var randomMovie: Movie! {
        movie.randomElement()
    }
    
    // MARK: - Override Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wideImage.image = UIImage(named: randomMovie.imageWide)
        titleMovieLabel.text = randomMovie.name
        genreMovieLabel.text = randomMovie.genre
        raitingMovieLabel.text = "⭐️ " + randomMovie.raiting
        summaryTextView.text = randomMovie.desctiption
    }
}
