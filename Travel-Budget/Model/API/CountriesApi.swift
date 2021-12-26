//
//  GetCountries.swift
//  Travel-Budget
//
//  Created by Mac on 13/12/2021.
//

import Foundation
import FirebaseFirestore
class CountriesApi {
    
    
    static func getCountries(completion: @escaping (Countries) -> Void) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        
        refCountries.getDocuments { doucments, error in
            guard let doucments = doucments else { return }
            for document in doucments.documents {
                refCountries.document(document.documentID).getDocument { document, error in
                    if let document = document, document.exists {
                        let countries = Countries.getDataFromCountries(dict: document.data()!)
                        completion(countries)
                    }
                }
            }
        }
    }
}
