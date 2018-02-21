//
//  ViewController.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 18-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        loadDesign()
        super.viewDidLoad()
        
        
    }

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let topArtistCVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TopArtistsCVC")
        let topArtistsTVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TopArtistsTVC")
        return [topArtistCVC, topArtistsTVC]
    }

    func loadDesign() {
    
        let colorPrimary = UIColor(red:0.22, green:0.24, blue:0.26, alpha:1.0)
        self.settings.style.selectedBarHeight = 2
        self.settings.style.selectedBarBackgroundColor = UIColor.red
        self.settings.style.buttonBarBackgroundColor = colorPrimary
        self.settings.style.buttonBarItemBackgroundColor = colorPrimary
        self.settings.style.selectedBarBackgroundColor = UIColor.white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        self.settings.style.selectedBarHeight = 4
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10
        self.settings.style.buttonBarRightContentInset = 10
        
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = UIColor.white
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        
        let navBar = self.navigationController?.navigationBar
        if let navBar = navBar{
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
        }
        
    }

}

