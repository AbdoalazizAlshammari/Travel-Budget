//
//  Login+SginUpVC.swift
//  Travel-Budget
//
//  Created by Mac on 07/12/2021.
//

import UIKit
import FirebaseAuth
class SginInVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passowrd: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            }else {
                self.performSegue(withIdentifier: "Home", sender: nil)
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            // ...
        }
    }
   
    
    @IBAction func SignIn(_ sender: Any) {
    
    
        SignIn(email: email.text ?? "", password: passowrd.text ?? "")

}

    @IBAction func Sginup(_ sender: Any) {
        performSegue(withIdentifier: "registrationscreen", sender: nil)
    }
    
    

}
