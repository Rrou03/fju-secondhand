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

    
    @IBOutlet weak var unFavorite: UIButton!
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var PostPrice: UILabel!
    @IBOutlet weak var PostLocation: UILabel!
    @IBOutlet weak var PostType: UILabel!
    @IBOutlet weak var PostTitle: UILabel!
    var PostID: String!
    var uid = ""
    var poid = ""
    var ref: DatabaseReference?
    var reff: DatabaseReference?
    
   
    
   
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
    @IBAction func addFavorite(_ sender: UIButton) {
       self.unFavorite.isEnabled = false
        
        if let user = Auth.auth().currentUser{
            self.uid = user.uid
        }
        
        //取得POST ID
        
        ref  = Database.database().reference()
        
        //將post加到user的最愛清單內
        ref?.child("RentPost").child(self.PostID).observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.poid = value?["PostID"] as? String ?? ""
         Database.database().reference(withPath: "User/\(self.uid)/LikeList/\(self.poid)").setValue("like")
         Database.database().reference(withPath: "RentPost/\(self.poid)/LikeUser/\(self.uid)").setValue(self.uid)
        })
        
        self.FavoriteButton.isHidden = false
        self.unFavorite.isHidden = true
        self.unFavorite.isEnabled = true
        }
    
    
   
    @IBAction func deleteFavorite(_ sender: UIButton) {
       self.FavoriteButton.isEnabled = false
        if let user = Auth.auth().currentUser{
            self.uid = user.uid
        }
         ref  = Database.database().reference()
         reff  = Database.database().reference()
        
        print("6666")
        print(self.PostID)
        
        ref?.child("User").child(self.uid).child("LikeList").child(self.PostID).removeValue(completionBlock: {
            (error, ok) in
            if error == nil{
                print("User delete success")
            }else{
                print("User delete error")
            }
        })
       reff?.child("RentPost").child(self.PostID).child("LikeUser").child(self.uid).removeValue(completionBlock: {(error, ok) in
            if error == nil{
                print("Post delete success")
            }else{
                print("Post delete error")
            }
            
            
            })
        self.FavoriteButton.isHidden = true
        self.unFavorite.isHidden = false
        self.FavoriteButton.isEnabled = true
            
            
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
