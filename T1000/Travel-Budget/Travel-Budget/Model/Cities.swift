//
//  Cities.swift
//  Travel-Budget
//
//  Created by Mac on 13/12/2021.
//

import Foundation
class Cities {
    var description: String?
    var name :String?
    var imageCity : String?
    var id : String?
    var places : [String:Any]?
}

extension Cities {
    
    static func getDataFromCities(dict: [String: Any]) -> Cities {

        let city = Cities()

        city.id = dict["id"] as? String
        city.description = dict["description"] as? String
        city.name = dict["name"] as? String
        city.imageCity = dict["imageCity"] as? String
        city.places = dict["places"] as? [String:Any]

        return city
    }
}
