//
//  CitiysApi.swift
//  Travel-Budget
//
//  Created by Mac on 16/12/2021.
//

import Foundation
import FirebaseFirestore
// to get Cities from firebase
class CitiysApi {
    
    static func getCitys(idCountry:String,completion: @escaping (Cities) -> Void) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        
        refCountries.document(idCountry).getDocument { document, error in
            if let document = document, document.exists {
                
                guard let citysKey =  document.data()!["Cities"] as? [String : Any] else {return}
                for key in citysKey.keys {
                    let objectCity = Cities.getDataFromCities(dict: citysKey["\(key)"] as! [String : Any])
                    completion(objectCity)
                }
            }
        }
    }
}
