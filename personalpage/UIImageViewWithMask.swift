//
//  UIImageViewWithMask.swift
//  second hand
//
//  Created by Ines on 2017/12/24.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
@IBDesignable

class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()
    @IBInspectable
    var maskImage : UIImage? {
        didSet{
            maskImageView.image = maskImage
            maskImageView.frame = bounds
            
            mask = maskImageView
        }
        
    }
}
