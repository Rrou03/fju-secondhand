//
//  signupViewController.swift
//  second hand
//
//  Created by rourou on 2017/12/12.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class signupViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = Auth.auth().currentUser{
            uid = user.uid
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signupButtom(_ sender: UIButton) {
        
        if userNameTextField.text != "" && userEmailTextField.text!.hasSuffix("@mail.fju.edu.tw") && userPasswordTextField.text!.count >= 6  {
            
            Auth.auth().createUser(withEmail: self.userEmailTextField.text!,  password: self.userPasswordTextField.text!, completion:{(user, error) in
                if error == nil {
                    if let user = Auth.auth().currentUser{
                        self.uid = user.uid
                    }
                    print("You have successfully signed up")
                    Database.database().reference(withPath: "User/\(self.uid)/Profile/Username").setValue(self.userNameTextField.text)
                    Database.database().reference(withPath: "User/\(self.uid)/Profile/Password").setValue(self.userPasswordTextField.text)
                    Database.database().reference(withPath: "User/\(self.uid)/Profile/Email").setValue(self.userEmailTextField.text)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SuccessViewControllerID") as! SuccessViewController
                    self.present(vc, animated: true, completion: nil)
                }else{
                    print("fail",error.debugDescription)
                }
                
            }  )
        }else{
             let errorController = UIAlertController(title: "Error", message: "請輸入正確的學校信箱或密碼(至少需六位元)", preferredStyle: .alert)
            let errorActionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            errorController.addAction(errorActionOK)
            self.present(errorController, animated: true, completion: nil)
           
        }
        
    }
    

   
}
