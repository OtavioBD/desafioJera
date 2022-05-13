//
//  CelulaTableViewCell.swift
//  loginScreen
//
//  Created by Otavio Benatti Dias on 11/05/22.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var vote_averageLabel: UILabel!
    
    @IBAction func toWatchButton(_ sender: Any) {
        let newMovie = MovieDB(context: self.context)
        newMovie.title = movie?.title
        newMovie.overview = movie?.overview
        newMovie.voteAverage = movie?.vote_average ?? 0.0
        
        
        do {
            try self.context.save()
        }
        catch  {
        }
        
    }
    
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
            overviewLabel.text = movie?.overview
            vote_averageLabel.text = String(format: "%f", movie?.vote_average ?? 0)
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
