//
//  productNewPost.swift
//  second hand
//
//  Created by Chloe on 2017/12/24.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON
//SwiftyJSON是个使用Swift语言编写的开源库，可以让我们很方便地处理JSON数据（解析数据、生成数据)
class productNewPost{
    
    var ProductName: String!
    var ProductType: String!
    var ProductPrice: String!
    var ProductSituation: String!
    var ProductLocation: String!
    var ProductPS: String!
    var imageDownloadURL: String!
    private var image = UIImage()
    
    init(image: UIImage,ProductName:String, ProductType: String, ProductPrice: String, ProductSituation: String, ProductLocation: String, ProductPS: String){
        self.ProductName = ProductName
        self.ProductType = ProductType
        self.ProductPrice = ProductPrice
        self.ProductSituation = ProductSituation
        self.ProductLocation = ProductLocation
        self.ProductPS = ProductPS
        self.image = image
        
    }
    
    init (snapshot: DataSnapshot){
        
        let json = JSON(snapshot.value)
        self.imageDownloadURL = json["imageDownloadURL"].stringValue
        self.ProductName = json["ProductName"].stringValue
        self.ProductType = json["ProductType"].stringValue
        self.ProductPrice = json["ProductPrice"].stringValue
        self.ProductSituation = json["ProductSituation"].stringValue
        self.ProductLocation = json["ProductLocation"].stringValue
        self.ProductPS = json["ProductPS"].stringValue
    }
    func save(){
        //1. create a new database reference
        let newProductPostRef = Database.database().reference().child("ProductPost").childByAutoId()
        let newProductPostKey = newProductPostRef.key
        if let imageData = UIImageJPEGRepresentation(self.image, 0.6){
            //2. create a new storage reference
            let imageStorageRef = Storage.storage().reference().child("Productimages")
            let newImageRef = imageStorageRef.child(newProductPostKey)
            //3. save the image to storage first
            newImageRef.putData(imageData).observe(.success, handler: { (snapshot) in
                //4. save the post info and downloadURL
                self.imageDownloadURL = snapshot.metadata?.downloadURL()?.absoluteString
                let newProductPostDictionary = [
                    "imageDownloadURL" : self.imageDownloadURL,
                    "ProductName" : self.ProductName,
                    "ProductType" : self.ProductType,
                    "ProductPrice" : self.ProductPrice,
                    "ProductSituation" : self.ProductSituation,
                    "ProductLocation" : self.ProductLocation,
                    "ProductPS" : self.ProductPS
                ]
                newProductPostRef.setValue(newProductPostDictionary)
            })
            
        }
    }
    
    
    
    
    
    
    
    
}
