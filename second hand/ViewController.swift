//
//  ViewController.swift
//  second hand
//
//  Created by rourou on 2017/11/29.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var categorybuttons: [UIButton]!
    
    @IBOutlet var arrangebutton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleselection(_ sender: UIButton) {
        categorybuttons.forEach { (button) in
            button.isHidden = !button.isHidden
            
        }
    }
    
    @IBAction func categorytapped(_ sender: UIButton) {
    }
    
    @IBAction func handleselection2(_ sender: UIButton) {
        arrangebutton.forEach { (button) in
            
        button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func arrangetapped(_ sender: UIButton) {
    }
    
}

