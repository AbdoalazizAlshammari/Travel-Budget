//
//  TableViewCellFavorite.swift
//  Travel-Budget
//
//  Created by Mac on 09/01/2022.
//

import UIKit
import FirebaseFirestore
import Firebase
// Table View cell for fav image and title outlets
class TableViewCellFavorite: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
