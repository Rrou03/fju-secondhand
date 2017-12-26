//
//  rentPostViewController.swift
//  second hand
//
//  Created by rourou on 2017/12/20.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class rentPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var posts = [rentNewPost]()
    
    //利用按鈕到個人頁面
    @IBAction func gotopersonalpage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PersonalPage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"PersonalPageNavigationControllerID") as! PersonalPageNavigationController
        self.present(vc,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //download posts
          // 1. create a reference to a rentPost in the database
        Database.database().reference().child("RentPost").observe(.childAdded){
            (snapshot) in
            // get called for every existing child or when a new child is added to "RentPost"\
            
           
            
            DispatchQueue.main.async {
                // 2.parse the post (取出snapshot裡的資料)
                let newPost = rentNewPost(/*rentNewPost裡的方法*/snapshot: snapshot/*把這裡的snapshot資料傳去rentNewPost的snapshot方法*/)
                self.posts.insert(newPost, at: 0)//將newPost加進posts[]陣列中的第一個
                let indexPath = IndexPath(row: 0, section: 0)//取得頂端的位置
                // 3.update table view
                self.table.insertRows(at: [indexPath], with: .top)//update後newPost會被insert至頂端
            }
           
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! rentPostTVCell
        cell.post = self.posts[indexPath.row]
        
        return cell
    }
    
}
