//
//  TableViewControllerProfileUser.swift
//  Travel-Budget
//
//  Created by Mac on 15/12/2021.
//

import UIKit
import FirebaseAuth
// Table View Controller to view user info caming from firebase
class TableViewControllerProfileUser: UITableViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { User in
            self.userName.text = User.name
            self.phoneNumber.text = User.phone
            self.email.text = User.email
            
        }
    }
}
