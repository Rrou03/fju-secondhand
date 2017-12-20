//
//  ViewController.swift
//  second hand
//
//  Created by rourou on 2017/11/29.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func backtostart(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    
}

