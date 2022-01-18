//
// SginInVC.swift
//  Travel-Budget
//  Created by Mac on 07/12/2021.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

// Calss View Controller for Sgining in user
class SginInVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passowrd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        //        self.view.addGestureRecognizer(UIGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        if Auth.auth().currentUser != nil {
        //            self.performSegue(withIdentifier: "Home", sender: nil)
        //        }
    }
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                let errorUser = UIAlertController(title: "The Email or The Password is wrong.".localize, message: "You must check the Email and password".localize, preferredStyle: .alert)
                errorUser.addAction(UIAlertAction(title: "try again".localize, style: .cancel, handler: nil))
                self.present(errorUser, animated: false)
            }else {
                self.performSegue(withIdentifier: "Home", sender: nil)
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
        }
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func SignIn(_ sender: Any) {
        
        SignIn(email: email.text ?? "", password: passowrd.text ?? "")
    }
    
    @IBAction func Sginup(_ sender: Any) {
        
        performSegue(withIdentifier: "registrationscreen", sender: nil)
    }
}


