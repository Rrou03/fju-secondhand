//
//  categoryControllerViewController.swift
//  second hand
//
//  Created by 劉庭妤 on 2017/12/13.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit

class categoryControllerViewController: UIViewController {

    @IBOutlet var categoryselections: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleselection(_ sender: UIButton) {
    }
    
    @IBAction func categorytapped(_ sender: UIButton) {
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
