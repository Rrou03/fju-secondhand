//
//  UploadViewController.swift
//  second hand
//
//  Created by Ines on 2017/12/20.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Database.database().reference()
        let storage = Storage.storage().reference()
        let tempImageRef = storage.child("tmpDir/tmpImage.jpg")
        let image = UIImage(named:"ik.jpg")
        let metaData = StorageMetadata()
        metaData.contentType="image/jpg"
        tempImageRef.putData(UIImageJPEGRepresentation(image!,0.8)!, metadata: metaData){ (data,error) in
            if error == nil{
                print("upload successful")
            }else{
                print(error?.localizedDescription as Any)
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
