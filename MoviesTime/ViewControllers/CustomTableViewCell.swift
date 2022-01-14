//
//  CustomTableViewCell.swift
//  MoviesTime
//
//  Created by Victor on 07.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var imageOfMovies: UIImageView!


    // MARK: - Override Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // MARK: - Public Methods
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        summaryLabel.text = movie.overview
        raitingLabel.text = String(format: "%.1f", Double(movie.rate ?? 0))
        
        DispatchQueue.main.async {
            guard let image = movie.image else { return }
            let urlString = Url.imageUrl.rawValue + image
            
            guard let url = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            self.imageOfMovies.image = UIImage(data: imageData)
        }
//        self.imageOfMovies.image = nil
    }
    
    // MARK: - Private Methods

}
