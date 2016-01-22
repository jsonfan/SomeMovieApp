//
//  MovieTableCell.swift
//  MovieApp
//
//  Created by Jason on 1/21/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit
import Alamofire

class MovieTableCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releasedLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    private var _model: Movie? = nil
    
    var model: Movie? {
        get {
            return self._model
        }
        set {
            self._model = newValue
            self.titleLabel!.text = self._model!.title
            self.releasedLabel!.text = self._model!.released
            self.ratingLabel!.text = self._model!.imdbRating
            Alamofire.request(.GET, self._model!.poster).response { (request, response, data, error) in
                self.mainImageView.image = UIImage(data: data!, scale:1)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
