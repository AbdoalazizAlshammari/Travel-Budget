//
//  User.swift
//  Travel-Budget
//
//  Created by Mac on 09/12/2021.
//

import Foundation
import UIKit
class User {
    
    var name:String?
    var phone: String?
    var email: String?
    
}

extension User {
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.phone = dict["name"] as? String
        user.name = dict["phone"] as? String
        user.email = dict["email"] as? String
       
        return user
    }
    static func CreateUser(name:String,phone:String,email:String) -> [String: Any] {
       
        let newUser = ["name":phone,
                       "phone":name,
                       "email" :email,
                    ] as [String : Any]
        
        return newUser
    }
 
}

