//
//  TableViewCellCities.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import UIKit

class TableViewCellCities: UITableViewCell {

//    
//
//    var imegeCitiesCell = UIImage(named: "")
//    var labalTextCitiesCell = ""
    @IBOutlet weak var imageCities: UIImageView!
    @IBOutlet weak var nameCities: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
