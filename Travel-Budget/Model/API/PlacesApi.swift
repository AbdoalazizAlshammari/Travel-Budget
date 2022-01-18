//
//  PlacesApi.swift
//  Travel-Budget
//
//  Created by Mac on 19/12/2021.
//

import Foundation
import FirebaseFirestore

// to get places from firebase
class PlacesApi {
    
    static func getPlaces(city:Cities,idCountries:String,completion: @escaping (Places) -> Void) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        
        refCountries.document(idCountries).getDocument { document, error in
            if let document = document, document.exists {
                
                guard let citysKey =  document.data()!["Cities"] as? [String : Any] else {return}
                guard let cityId =  city.id else {return}
                let objectCity = Cities.getDataFromCities(dict: citysKey["\(cityId)"] as! [String : Any])
                let objectPlace = Places.getDataFromplaces(dict: objectCity.places!)
                completion(objectPlace)
            }
        }
    }
}
