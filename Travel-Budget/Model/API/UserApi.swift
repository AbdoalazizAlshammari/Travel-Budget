//
//  UserApi.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import Foundation
import FirebaseFirestore

// Class User Api
class UserApi {
    // add user data to firebase
    static func addUser(name:String,uid:String,phone:String,email:String,favorite:[String],completion: @escaping (Bool) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        
        refUsers.document(uid).setData(User.createUser(name: name, phone: phone, email: email,favorite: favorite))
        
        completion(true)
        
    }
    // to get user
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
    }
}


