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
            }
        }
        artistNameLabel.text = artistName
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
