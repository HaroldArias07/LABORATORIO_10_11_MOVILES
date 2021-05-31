//
//  SignUpViewController.swift
//  Snapchat
//
//  Created by mbtec22 on 20/05/21.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var userOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
    }

    func setUpStyle(){
        signUpButton.layer.cornerRadius = 6.0
    }

    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        let user = userOrEmailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: user, password: password) { (responseUser, error) in
            if error == nil {
                print("El usuario fue creado exitosamente")
                //FIRDatabase.database().reference().child("usuarios").child(user!.uid).child("email").setValue(user!.user)
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "User or Password incorrect", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
