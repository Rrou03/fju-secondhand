//
//  rentVC.swift
//  second hand
//
//  Created by rourou on 2017/12/19.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit

class rentVC: UIViewController {
    
    
    @IBOutlet weak var housePhoto: UIImageView!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    let picker: UIImagePickerController = UIImagePickerController()
    var takenImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addImageButton(_ sender: UIButton) {
        
        //建立提示框
        let alertController = UIAlertController()
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title:"取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[相機]按鈕
        let cameraAction = UIAlertAction(title:"相機", style: .default){(action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                self.picker.sourceType = UIImagePickerControllerSourceType.camera
                self.picker.delegate = self
                self.present(self.picker, animated:true, completion: nil)
            }else{
                print("no camera!")
            }
        }
        alertController.addAction(cameraAction)
        //建立[圖片庫]按鈕
        let libAction = UIAlertAction(title:"圖片庫", style: .default){(action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            self.picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.picker.delegate = self 
            self.present(self.picker, animated: true, completion: nil)
        }else{
            print("fail!")
        }
        }
        alertController.addAction(libAction)
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)

}
    
    @IBAction func addPost(_ sender: Any) {
        let newPost = rentNewPost(image: takenImage,title: titleField.text!, price: priceField.text!, goal: goalField.text!, location: locationField.text!, type: typeField.text!)
        newPost.save()
        self.dismiss(animated: true, completion: nil)
    }
}
extension rentVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.takenImage = image
        self.housePhoto.image = takenImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated:true, completion:nil)
    }
}

