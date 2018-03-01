//
//  ArtistCVCell.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 21-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit

protocol FavoriteButtonPressed {
    func btnFavoritePressed(cell: ArtistCVCell)
}

class ArtistCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    var delegate: FavoriteButtonPressed?
    
    @IBAction func btnFavoritePressed(_ sender: Any) {
        if let _ = delegate {
            delegate?.btnFavoritePressed(cell: self)
        }
    }
    
    
}
