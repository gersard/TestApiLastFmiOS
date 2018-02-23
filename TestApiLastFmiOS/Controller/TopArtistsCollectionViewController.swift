//
//  TopArtistsCollectionViewController.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 18-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire

private let reuseIdentifier = "ArtistsCVC"

class TopArtistsCollectionViewController: UICollectionViewController {

    var topArtists: [Artist]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor(red:0.22, green:0.24, blue:0.26, alpha:1.0)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        ApiService.getTopArtist { (artistRoot) in
            if let artist = artistRoot?.artists.artist{
                self.topArtists = artist
                self.collectionView?.reloadData()
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return topArtists == nil ? 0 : (topArtists?.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtistCVCell
        
        let currentArtist = topArtists![indexPath.row]
        cell.nameLabel.text = currentArtist.name
        Alamofire.request(URL(string: currentArtist.image![2].text)!).response{
            (response) in
            cell.imageArtist.image = UIImage(data: response.data!, scale: 1)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension TopArtistsCollectionViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(image: UIImage(named: "flama_hyped"))
        //return IndicatorInfo(title: "Top Artistas")
    }
}
extension TopArtistsCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let widthScreen = UIScreen.main.bounds.size.width
        let cellWidth = widthScreen - 30
        
        return CGSize(width: cellWidth / 2, height: cellWidth / 2)
    }
}
