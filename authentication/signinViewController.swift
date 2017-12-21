//
//  signinViewController.swift
//  second hand
//
//  Created by rourou on 2017/12/15.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class signinViewController: UIViewController {
    @IBOutlet weak var EmailT: UITextField!
    
    @IBOutlet weak var PasswordT: UITextField!   
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signinB(_ sender: Any) {
        if self.EmailT.text != "" && self.PasswordT.text != ""{
            Auth.auth().signIn(withEmail: self.EmailT.text!, password: self.PasswordT.text!, completion:{(user,error) in
                if error == nil{
                    if let user = Auth.auth().currentUser{
                        self.uid = user.uid
                    }
                    Database.database().reference(withPath:"online status/\(self.uid)").setValue("ON")
                    let storyboard = UIStoryboard(name: "rent", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "rentPostViewControllerID") as! rentPostViewController
                    self.present(vc, animated: true, completion: nil)
                }else{
                    let errorController = UIAlertController(title: "Error", message: "帳號或密碼錯誤", preferredStyle: .alert)
                    let errorAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    errorController.addAction(errorAction)
                    self.present(errorController, animated: true, completion: nil)
                    
                }
            })
            
        }else{
            let errorController = UIAlertController(title: "Error", message: "帳號或密碼錯誤", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            errorController.addAction(errorAction)
            self.present(errorController, animated: true, completion: nil)
        }
    }
}
