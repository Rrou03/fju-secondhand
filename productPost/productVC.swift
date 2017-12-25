//
//  productVC.swift
//  second hand
//
//  Created by Chloe on 2017/12/23.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit

class productVC: UIViewController {
    @IBOutlet weak var HousePhoto: UIImageView!
    @IBOutlet weak var ProductNameField: UITextField!
    @IBOutlet weak var TypeField: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var SituationField: UITextField!
    @IBOutlet weak var ProductLocationField: UITextField!
    @IBOutlet weak var PSField: UITextField!
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
    @IBAction func AddPhoto(_ sender: UIButton) {
        
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
    @IBAction func AddPost(_ sender: Any) {
        let newPost = productNewPost(image: takenImage,ProductName: ProductNameField.text!, ProductType: TypeField.text!, ProductPrice: PriceField.text!, ProductSituation: SituationField.text!, ProductLocation: ProductLocationField.text!, ProductPS: PSField.text!)
        newPost.save()
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
extension productVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.takenImage = image
        self.HousePhoto.image = takenImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated:true, completion:nil)
    }
}
