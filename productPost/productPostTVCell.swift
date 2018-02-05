//
//  productPostTVCell.swift
//  second hand
//
//  Created by Chloe on 2017/12/23.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class productPostTVCell: UITableViewCell {
    @IBOutlet weak var PostProductImage: UIImageView!
    @IBOutlet weak var PostProductName: UILabel!
    @IBOutlet weak var PostProductPrice: UILabel!
    @IBOutlet weak var PostProductType: UILabel!
    @IBOutlet weak var PostProductSituation: UILabel!
    @IBOutlet weak var PostProductLocation: UILabel!
    @IBOutlet weak var PostProductPS: UILabel!
    
    var post: productNewPost!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        //change the information
        self.PostProductName.text = post.ProductName
        self.PostProductPrice.text = "$"+post.ProductPrice
        self.PostProductType.text = "類別:"+post.ProductType
        self.PostProductSituation.text = "狀況:"+post.ProductSituation
        self.PostProductLocation.text = "面交地點:"+post.ProductLocation
        self.PostProductPS.text = "備註:"+post.ProductPS
        //download the image
        // 1.create the storage reference
        if let imageURL = post.imageDownloadURL{
            // 2.download image data
            let imagestorageRef = Storage.storage().reference(forURL: imageURL)
            imagestorageRef.getData(maxSize: 2 * 1024 * 1024, completion: {[weak self](data, error) in
                if error == nil{
                    // 3.put the image to the ImageView
                    DispatchQueue.main.async{
                        if let imageData = data{
                            let image = UIImage(data: imageData)
                            self?.PostProductImage.image = image
                        }
                    }
                }else{
                    print("Error!!!!!!!!!!!!")
                }
            })
            
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
