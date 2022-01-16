//
//  Favorite.swift
//  Travel-Budget
//
//  Created by Mac on 09/01/2022.
//

import Foundation
import FirebaseFirestore

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
    
    
    static func deleteDocument(uid:String,favorite:String) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        let refFavorite = Firestore.firestore().collection("Favorite")
        
        refFavorite.document(uid).collection("AllFA").document(favorite).delete()
           // [START delete_document]
//           db.collection("Favorite").document("AllFA").delete() { err in
//               if let err = err {
//                   print("Error removing document: \(err)")
//               } else {
//                       print("Document successfully removed!")
//               }
//
//           }
//           // [END delete_document]
       }
    
    
    
    
    
}
