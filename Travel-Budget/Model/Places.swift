//
//  Places.swift
//  Travel-Budget
//
//  Created by Mac on 13/12/2021.
//

import Foundation

//class places with parperties
class Places {
    
    var images: [String]?
    var names: [String]?
    var places : [String:Any]?
}

extension Places {
    
    static func getDataFromplaces(dict: [String: Any]) -> Places {
        
        let place = Places()
        
        place.images = dict["images"] as? [String]
        place.names = dict["names"] as? [String]
        
        return place
    }
}
