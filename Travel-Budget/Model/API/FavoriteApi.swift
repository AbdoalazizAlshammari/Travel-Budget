//
//  Favorite.swift
//  Travel-Budget
//
//  Created by Mac on 09/01/2022.
//

import Foundation
import FirebaseFirestore
// add fav and save fav to firebase
class FavoriteApi{
    static func addFavorite(uid:String,favorite:String) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        let refFavorite = Firestore.firestore().collection("Favorite")
        
        refCountries.document(favorite).getDocument { document, error in
            if let document = document, document.exists {
                refFavorite.document(uid).collection("AllFA").document(favorite).setData(document.data()!)
            }
        }
    }
    // to get fav from firebase
    static func getFavorite(uid:String,completion: @escaping (Countries)-> Void) {
        
        
        let refFavorite = Firestore.firestore().collection("Favorite").document(uid).collection("AllFA")
        
        refFavorite.getDocuments { doucments, error in
            guard let doucments = doucments else { return }
            for document in doucments.documents {
                refFavorite.document(document.documentID).getDocument { document, error in
                    if let document = document, document.exists {
                        let countries = Countries.getDataFromCountries(dict: document.data()!)
                        completion(countries)
                    }
                }
            }
        }
    }
    
    // to delete fav from firebase
    static func deleteDocument(uid:String,favorite:String) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        let refFavorite = Firestore.firestore().collection("Favorite")
        
        refFavorite.document(uid).collection("AllFA").document(favorite).delete()
        
    }
}
