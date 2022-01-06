//
//  UserApi.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import Foundation
import FirebaseFirestore


class UserApi {
    
    static func addUser(name:String,uid:String,phone:String,email:String,favorite:[String],completion: @escaping (Bool) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        
        refUsers.document(uid).setData(User.CreateUser(name: name, phone: phone, email: email,favorite: favorite))
        
        completion(true)
        
    }
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
    }
    
    static func addFavorite(uid:String,favorite:String) {
        
        let refCountries = Firestore.firestore().collection("Countries")
        let refFavorite = Firestore.firestore().collection("Favorite")
        
        refCountries.document(favorite).getDocument { document, error in
            if let document = document, document.exists {
                refFavorite.document(uid).collection("AllFA").document().setData(document.data()!)
            }
        }
    }
    
}
