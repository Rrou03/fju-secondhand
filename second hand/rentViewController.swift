//
//  rectViewController.swift
//  second hand
//
//  Created by rourou on 2017/12/17.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit


class rentViewController: UIViewController {

    @IBOutlet var selectB: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectionButtom(_ sender: UIButton) {
        selectB.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                })
        }
    }
    
    @IBAction func buttomTapped(_ sender: UIButton) {
    }
    
    
}
