
//  SginUpVC.swift
//  Travel-Budget
//
//  Created by Mac on 07/12/2021.
//

import UIKit
import FirebaseAuth
// SginUp View controller for user
class SginUpVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passowrd: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            print(user.email ?? "email")
        }
    }
    
    func signUp(email: String,password:String,phone:String,name:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            UserApi.addUser(name: name, uid: authResult?.user.uid ?? "", phone: phone, email: email, favorite: ["favorite"]) { check in
                
                if check {
                    
                    self.displayAlert(withTitle: "thank you for signing up".localize, message: "weclome".localize, isSginup: true)
                    print("Done saving in Database")
                } else {
                    self.displayAlert(withTitle: "fail".localize, message: "", isSginup: false)
                }
            }
        }
    }
    
    
    @IBAction func sginup(_ sender: Any) {
        
        if email.text!.isEmpty && passowrd.text!.isEmpty && phone.text!.isEmpty && name.text!.isEmpty {
            self.displayAlert(withTitle: "Failed".localize, message: "please type in your email, password and phone number".localize, isSginup: false)
        }else{
            
            
            signUp(email: email.text ?? "", password: passowrd.text ?? "", phone: phone.text ?? "", name: name.text ?? "")
            
        }
    }
    func displayAlert(withTitle title: String, message: String,isSginup: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok".localize, comment: ""), style: .default, handler: { action in
            if isSginup {
                self.performSegue(withIdentifier: NSLocalizedString("Gohome", comment: ""), sender: nil)
            } else {
                
            }
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    
}
