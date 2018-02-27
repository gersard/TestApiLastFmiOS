//
//  TopAlbumsArtistCollectionViewController.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 23-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire

private let reuseIdentifier = "TopAlbumCell"

class TopAlbumsArtistCollectionViewController: UICollectionViewController {

    var artistName: String?
    var albums: [Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        ApiService.getTopAlbumsFromArtist(nameArtist: artistName!) { (albums) in
            if albums != nil {
                self.albums = albums
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
        
        return (self.albums != nil) ? (self.albums?.count)! : 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlbumCVCell
        
        let currentAlbum = albums![indexPath.row]
        cell.albumNameLabel.text = (currentAlbum.name != "") ? currentAlbum.name : "Sin nombre"
        if let imageUrl = URL(string: currentAlbum.image[2].text) {
            Alamofire.request(imageUrl).response{
                (response) in
                cell.albumImage.image = UIImage(data: response.data!, scale: 1)
            }
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
extension TopAlbumsArtistCollectionViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Albums")
    }
}
extension TopAlbumsArtistCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let widthScreen = UIScreen.main.bounds.size.width
        let cellWidth = widthScreen - 20
        
        return CGSize(width: cellWidth / 2, height: cellWidth / 2)
    }
}
