//
//  ChangeDataViewController.swift
//  second hand
//
//  Created by Ines on 2017/12/23.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ChangeDataViewController: UIViewController {

    @IBOutlet weak var personpic: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    

    var uid = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let user = Auth.auth().currentUser{
            uid = user.uid
        }
        //依循著某個路徑到某個位置
        //名稱
        var ref : DatabaseReference
        ref = Database.database().reference(withPath: "User/\(self.uid)/Profile/Username")
        ref.observe(.value, with: {(snapshot) in 
            let name = snapshot.value as! String
            self.username.text = name
            
        })
        
        //信箱
        ref = Database.database().reference(withPath: "User/\(self.uid)/Profile/Email")
        ref.observe(.value, with: {(snapshot) in 
            let email = snapshot.value as! String
            self.email.text = email
            
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func save(_ sender: Any) {
        
        if username.text != "" && email.text != ""  {
            Database.database().reference(withPath: "User/\(self.uid)/Profile/Username").setValue(username.text)
            Database.database().reference(withPath: "User/\(self.uid)/Profile/Email").setValue(email.text)
            
            
            let storyboard = UIStoryboard(name: "PersonalPage", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier:"PersonalPageNavigationControllerID") as! PersonalPageNavigationController
            self.present(vc,animated: true,completion: nil)


        }
    }
    


}
