//
//  TableViewCellBookings.swift
//  Travel-Budget
//
//  Created by Mac on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class CollectionViewCellCountries:UICollectionViewCell {
    
    
    
//    var imegeCell = UIImage(named: "")
//    var labalTextCell = ""
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!

    
    var favrite : String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    @IBAction func addFavorite(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid ?? ""
        UserApi.getUser(uid: uid) { user in
            
            UserApi.addFavorite(uid:uid , favorite: self.favrite)
            
        }
      
    }


}
