//
//  User.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import Foundation
import UIKit
//calss user with praperties
class User {
    
    var name:String?
    var phone: String?
    var email: String?
    var favorite :[String]?
    
}

extension User {
    
    static func getUser(dict: [String: Any]) -> User {
        
        let user = User()
        
        user.phone = dict["name"] as? String
        user.name = dict["phone"] as? String
        user.email = dict["email"] as? String
        user.favorite = dict["favorite"] as? [String]
        return user
    }
    static func createUser(name:String,phone:String,email:String,favorite:[String]) -> [String: Any] {
        
        let newUser = ["name":phone,
                       "phone":name,
                       "email" :email,
                       "favorite" :favorite,
        ] as [String : Any]
        
        return newUser
    }
    static func addFavorite(favorite:[String]) -> [String: Any] {
        
        let user = [
            "favorite" :[favorite],
        ] as [String : Any]
        
        return user
    }
    
    static func getFavorite(dict: [String: Any]) -> User {
        
        let user = User()
        
        user.favorite = dict["favorite"] as? [String]
        return user
    }
    
    
}

