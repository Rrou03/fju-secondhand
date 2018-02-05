//
//  PersonalPage.swift
//  second hand
//
//  Created by Ines on 2017/12/22.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PersonalPageController: UIViewController {

    @IBOutlet weak var head: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var changePersonalInfo: UIButton!
    
    var uid = ""//沒有值得String uid（身分證的概念）
    
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage=UIImage()
        //上面是把表題背景用成透明的程式
        
        
        if let user = Auth.auth().currentUser{
            uid = user.uid
            
        }
        viewDetail()
        
        logOut.isHidden = false
        changePersonalInfo.isHidden = false
        
        
    }
    func viewDetail(){
        //怎麼從firbase把資料拿下來 
        //怎麼拿上去是setvalue 怎麼拿下來是observe
        var ref : DatabaseReference
        
        username.isHidden = false
        email.isHidden = false
        
        ref = Database.database().reference(withPath:"User/\(self.uid)/Profile/Username")
        ref.observe(.value, with: {(snapshot) in 
            let name = snapshot.value as! String
            self.username.text = name
            self.username.isHidden = false
            
        })
        
        ref = Database.database().reference(withPath: "User/\(self.uid)/Profile/Email")
        ref.observe(.value, with: {(snapshot) in 
            let email = snapshot.value as! String
            self.email.text = email
            self.email.isHidden = false
            
        })
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changePersonInfo(_ sender: Any){
        let storyboard = UIStoryboard(name: "PersonalPage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"ChangeDataViewControllerID") as! ChangeDataViewController
        self.present(vc,animated: true,completion: nil)
        
    }
    @IBAction func logOut(_ sender: Any) {
        let ref = Database.database().reference(withPath: "online status/\(uid)")
        ref.setValue("OFF")
        try!Auth.auth().signOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"MainNavigationControllerID") as! MainNavigationController
        self.present(vc,animated: true,completion: nil)
        
        
    }
    
    

   

}
