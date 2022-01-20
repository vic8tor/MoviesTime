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
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var raitingMovieLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    // MARK: - Public Properties
    var movies: Movie!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        titleMovieLabel.text = movies.title
        releaseDateLabel.text = movies.year
        raitingMovieLabel.text = "⭐️ \(String(format: "%.1f", Double(movies.rate ?? 0)))"
        summaryTextView.text = movies.overview
        imageDownload()
    }

    
    // MARK: - @IBActions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func imageDownload() {
        DispatchQueue.main.async {
            guard let image = self.movies.wideImage else { return }
            let urlString = Link.imageUrl.rawValue + image
        
            guard let url = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            self.wideImage.image = UIImage(data: imageData)
        }
    }

}

