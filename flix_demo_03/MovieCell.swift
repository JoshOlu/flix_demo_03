//
//  MovieCell.swift
//  flix_demo_03
//
//  Created by Josh Olumese on 6/21/17.
//  Copyright © 2017 Josh Olumese. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!

    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet(newMovies) {
            titleLabel.text! = movie.title
            overviewLabel.text! = movie.overview
            if let validURL = movie.posterUrl {
                self.posterImageView.af_setImage(withURL: validURL)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
