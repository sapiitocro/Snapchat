//
//  iniciarSesionViewController.swift
//  Snapchat
//
//  Created by Mac Tecsup on 16/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user,error)in
            print("Intentamos Iniciar Sesion")
            if error != nil {
            print ("Tenemos el siguiente error:\(String(describing: error))")
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user,error)in
            print("Intentamos crear un usuario")
            if error != nil {
                print ("Tenemos el siguiente error:\(String(describing: error))")
            }else {
                print("El usuario fue creado correctamente")
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
            }else{
               print("Inicio de Sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
})
    }
}
