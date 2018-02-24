//
//  DetailArtistViewController.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 23-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DetailArtistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
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
