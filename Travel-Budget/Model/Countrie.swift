//
//  Countrie.swift
//  Travel-Budget
//
//  Created by Mac on 12/12/2021.
//

import Foundation
//class countries with its partperites
class Countries {
    
    var imageCountry: String?
    var nameCountry :String?
    var id: String?
    var selctedCase :Int?
}

extension Countries {
    
    static func getDataFromCountries(dict: [String: Any]) -> Countries {
        
        let countrie = Countries()
        
        countrie.imageCountry = dict["imageCountry"] as? String
        countrie.nameCountry = dict["nameCountry"] as? String
        countrie.selctedCase = dict["selctedCase"] as? Int
        countrie.id = dict["id"] as? String
        
        return countrie
    }
}
