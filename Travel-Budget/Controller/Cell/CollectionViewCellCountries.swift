//
//  TableViewCellBookings.swift
//  Travel-Budget
//
//  Created by Mac on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
// Cell for collection of countries
class CollectionViewCellCountries:UICollectionViewCell {
    
    var activeFav:Bool = false
    
    @IBOutlet weak var fav: UIButton!
    @IBOutlet weak var setFav: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    
    var parentController : UIViewController!
    
    
    var favrite : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // action for add to fav selected failled red
    
    @IBAction func addFavorite(_ sender: Any) {
        
        
        if activeFav {
            
            activeFav = false
            fav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            fav.tintColor = UIColor.white
            
        } else {
            activeFav = true
            fav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            fav.tintColor = UIColor.red
            
            let uid = Auth.auth().currentUser?.uid ?? ""
            UserApi.getUser(uid: uid) { user in
                
                FavoriteApi.addFavorite(uid: uid, favorite: self.favrite)
            }
        }
        
        let favAdded = UIAlertController(title: "Done".localize, message: "Favorite Added in the list".localize, preferredStyle: .alert)
        favAdded.addAction(UIAlertAction(title: "Done".localize, style: .cancel,handler: nil))
        self.parentController.present(favAdded, animated: true, completion: nil)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        activeFav = false
        fav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        fav.tintColor = UIColor.white
        
    }
}
