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
import RealmSwift

private let reuseIdentifier = "ArtistsCVC"

class TopArtistsCollectionViewController: UICollectionViewController, FavoriteButtonPressed {

    var topArtists: [Artist]?
    var artistSelected : Artist?
    let realm = try! Realm()
    
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
        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CvToDetalle" {
            if let mainDetailNVC = segue.destination as? UINavigationController{
                if let detailVC = mainDetailNVC.topViewController as? MainDetailViewController {
                        detailVC.nameArtist = artistSelected?.name
                }
            }
        }
        
    }
 

    // MARK: UICollectionViewDataSource
   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return topArtists == nil ? 0 : (topArtists?.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtistCVCell
        
        let currentArtist = topArtists![indexPath.row]
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "name = %@ ", currentArtist.name)])
        var artistRealm: ArtistRealm? = realm.objects(ArtistRealm.self).filter(predicate).first
        
        if artistRealm == nil {
            try! realm.write {
                artistRealm = ArtistRealm()
                artistRealm!.name = currentArtist.name
                artistRealm!.isFavoriote = false
                realm.add(artistRealm!)
            }
        } else {
            cell.buttonFavorite.isSelected = (artistRealm?.isFavoriote ?? false)
        }
        
        
        
        
        cell.nameLabel.text = currentArtist.name
        Alamofire.request(URL(string: currentArtist.image![2].text)!).response{
            (response) in
            cell.imageArtist.image = UIImage(data: response.data!, scale: 1)
        }
        cell.delegate = self
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.artistSelected = self.topArtists![indexPath.row]
        self.performSegue(withIdentifier: "CvToDetalle", sender: nil)
    }
    
    func btnFavoritePressed(cell: ArtistCVCell) {
        let indexPath = self.collectionView?.indexPath(for: cell)
        
        let favorite = !cell.buttonFavorite.isSelected
        cell.buttonFavorite.isSelected = favorite
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "name = %@ ", topArtists![(indexPath?.row)!].name)])
        let artistRealm: ArtistRealm? = realm.objects(ArtistRealm.self).filter(predicate).first
        if artistRealm != nil {
            try! realm.write {
                artistRealm?.isFavoriote = !((artistRealm?.isFavoriote)!)
            }
        }
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
