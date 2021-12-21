//
//  SginUpVC.swift
//  Travel-Budget
//
//  Created by Mac on 07/12/2021.
//

import UIKit
import FirebaseAuth

class SginUpVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passowrd: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            print(user.email ?? "email")
        }

    }

    
    func SignUp(email: String,password:String,phone:String,name:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            UserApi.addUser(name: name, uid: authResult?.user.uid ?? "", phone: phone, email: email) { check in
              
                if check {
//                    self.showAlert(DisplayAlert(withTitle: "thnak you for Signing up", message: "welcome", isSginup: true))
                    self.DisplayAlert(withTitle: "thank you for signing up", message: "weclome", isSginup: true)
                    print("Done saving in Database")
                    /// fffffff
                } else {
                    self.DisplayAlert(withTitle: "fail", message: "", isSginup: false)
                }
            }
        }
    }
  
    @IBAction func sginup(_ sender: Any) {
        
    
        SignUp(email: email.text ?? "", password: passowrd.text ?? "", phone: Phone.text ?? "", name: name.text ?? "")

    }
    func DisplayAlert(withTitle title: String, message: String,isSginup: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { action in
            if isSginup {
                self.performSegue(withIdentifier: NSLocalizedString("registrationscreen", comment: ""), sender: nil)
            } else {
                
            }
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }


}
