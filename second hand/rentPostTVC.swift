//
//  rentPostTVC.swift
//  second hand
//
//  Created by rourou on 2017/12/20.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit

class rentPostVC: UIViewController {
    
    @IBOutlet var options: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    @IBAction func buttonTapped(_ sender: UIButton) {
        options.forEach{(UIButton) in
            UIView.animate(withDuration: 0.3, animations: {
                UIButton.isHidden = !UIButton.isHidden
                self.view.layoutIfNeeded()
            })

    }
    
}
}
