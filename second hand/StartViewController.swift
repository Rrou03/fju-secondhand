//
//  StartViewController.swift
//  second hand
//
//  Created by Ines on 2017/12/19.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Foundation
import Firebase



class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     

    }
    @IBAction func startTapped(_ sender: Any) {
        let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")as! MainNavigationController
        
        present(mainNavigationController,animated: true,completion: nil) 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

  
}
