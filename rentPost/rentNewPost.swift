//
//  rentNewPost.swift
//  second hand
//
//  Created by rourou on 2017/12/19.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class rentNewPost {
    
    var title: String!
    var price: String!
    var goal: String!
    var location: String!
    var type: String!
    var imageDownloadURL: String!
    var postID: String!
    var LikeList: [String] = [String]()
    var list: String!

    private var image = UIImage()
    
    init(image: UIImage,title:String, price: String, goal: String, location: String, type: String){
        self.title = title
        self.image = image
        self.price = price
        self.goal = goal
        self.location = location
        self.type = type
        
    }
    
    init (snapshot: DataSnapshot){
        
        let json = JSON(snapshot.value)
        self.imageDownloadURL = json["imageDownloadURL"].stringValue
        self.title = json["title"].stringValue
        self.price = json["price"].stringValue
        self.goal = json["goal"].stringValue
        self.location = json["location"].stringValue
        self.type = json["type"].stringValue
        self.postID = json["PostID"].stringValue
        self.list = json["LikeUser"][(Auth.auth().currentUser?.uid)!].stringValue
        
        print(self.list)
       
        
        
    }
    
    
    func save(){
        //1. create a new database reference
        let newRentPostRef = Database.database().reference().child("RentPost").childByAutoId()
        let newRentPostKey = newRentPostRef.key
        if let imageData = UIImageJPEGRepresentation(self.image, 0.6){
        //2. create a new storage reference
        let imageStorageRef = Storage.storage().reference().child("Rentimages")
        let newImageRef = imageStorageRef.child(newRentPostKey)
            //3. save the image to storage first
            newImageRef.putData(imageData).observe(.success, handler: { (snapshot) in
                //4. save the post info and downloadURL
            self.imageDownloadURL = snapshot.metadata?.downloadURL()?.absoluteString
            let newRentPostDictionary = [
                "imageDownloadURL" : self.imageDownloadURL,
                "title" : self.title,
                "price" : self.price,
                "goal" : self.goal,
                "location" : self.location,
                "type" : self.type,
                "PostID": newRentPostKey
                ]
             newRentPostRef.setValue(newRentPostDictionary)
            })
            
        }
    }
}

