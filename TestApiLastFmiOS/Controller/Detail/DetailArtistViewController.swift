//
//  DetailArtistViewController.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 23-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire

class DetailArtistViewController: UIViewController {
    
    @IBOutlet weak var viewScrollable: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistListenersLabel: UILabel!
    @IBOutlet weak var artistPlaycountsLabel: UILabel!
    @IBOutlet weak var artistTagsLabel: UILabel!
    @IBOutlet weak var artistInfoLabel: UILabel!
    var artistName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.getInfoArtist(nameArtist: artistName!) { (artist) in
            if artist != nil {
                Alamofire.request(URL(string: (artist?.image![2].text)!)!).response{
                    (response) in
                    self.artistImage.image = UIImage(data: response.data!, scale: 1)
                }
                self.artistInfoLabel.text = artist?.bio?.content
                self.artistListenersLabel.text = artist?.stats?.listeners
                self.artistPlaycountsLabel.text = artist?.stats?.playcount
                
                var tags = ""
                for tag in (artist?.tags?.tag)! {
                    tags = (tags.isEmpty) ? "\(tag.name)" : "\(tags),\(tag.name)"
                }
                self.artistTagsLabel.text = tags
                
            }
        }
        artistNameLabel.text = artistName
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.artistInfoLabel.bounds.height + 300)
         //self.scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.viewScrollable.bounds.height + 200)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailArtistViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Detalle")
    }
}
