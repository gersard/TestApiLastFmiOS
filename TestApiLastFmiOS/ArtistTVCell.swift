//
//  ArtistTVCell.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 22-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit

class ArtistTVCell: UITableViewCell {
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
