//
//  rentPostTVCell.swift
//  second hand
//
//  Created by rourou on 2017/12/20.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class rentPostTVCell: UITableViewCell {

    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var PostPrice: UILabel!
    @IBOutlet weak var PostLocation: UILabel!
    @IBOutlet weak var PostType: UILabel!
    @IBOutlet weak var PostTitle: UILabel!
    
    var post: rentNewPost!{
    didSet{
        self.updateUI()
        }
    }
    func updateUI(){
        //change the information
        self.PostPrice.text = "$"+post.price
        self.PostLocation.text = post.location
        self.PostType.text = post.type
        self.PostTitle.text = post.title
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
                        self?.PostImage.image = image
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
