//
//  TrackTVCell.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 26-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit

class TrackTVCell: UITableViewCell {
    @IBOutlet weak var nameTrackLabel: UILabel!
    @IBOutlet weak var listenersTrackLabel: UILabel!
    @IBOutlet weak var playcountsTrackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
