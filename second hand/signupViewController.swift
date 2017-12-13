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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signupButtom(_ sender: Any) {
        if self.userEmailTextField.text != "" || self.userPasswordTextField.text != ""{
            
            Auth.auth().createUser(withEmail: self.userEmailTextField.text!,  password: self.userPasswordTextField.text!, completion:{(user, error) in
                if error == nil {
                    if let user = Auth.auth().currentUser{
                        self.uid = user.uid
                        print("You have successfully signed up")
                    
                    }
                }
                
                Database.database().reference(withPath: "ID/\(self.uid)/Profile/Username").setValue(self.userNameTextField.text)
                Database.database().reference(withPath: "ID/\(self.uid)/Profile/Safety-Check").setValue("ON")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
                self.present(vc, animated: true, completion: nil)
               
                
            }  )
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
