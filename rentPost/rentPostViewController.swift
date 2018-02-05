//
//  rentPostViewController.swift
//  second hand
//
//  Created by rourou on 2017/12/20.
//  Copyright © 2017年 apple050. All rights reserved.
//

import UIKit
import Firebase

class rentPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet var Options: [UIButton]!
    @IBOutlet weak var table: UITableView!
    var posts = [rentNewPost]()
    
    //view 被載入時
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Search Bar
        createSearchBar()
        
        //download posts
          // 1. create a reference to a rentPost in the database
        Database.database().reference().child("RentPost").observe(.childAdded){
            (snapshot) in
            // get called for every existing child or when a new child is added to "RentPost"\
            
            DispatchQueue.main.async {
                // 2.parse the post (取出snapshot裡的資料)snapshot=對資料庫的某一個時間點，凍結記錄內容並完整的紀錄下來。
                let newPost = rentNewPost(/*rentNewPost裡的方法*/snapshot: snapshot/*把這裡的snapshot資料傳去rentNewPost的snapshot方法*/)
               
                self.posts.insert(newPost, at: 0)//將newPost加進posts[]陣列中的第一個
                let indexPath = IndexPath(row: 0, section: 0)//取得頂端的位置
                // 3.update table view
                self.table.insertRows(at: [indexPath], with: .top)//update後newPost會被insert至頂端
            }
           
            
        }
    }
    
    private func createSearchBar(){
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "looking for a good place?"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
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
        cell.PostID = self.posts[indexPath.row].postID
        let uid = Auth.auth().currentUser?.uid
        if uid == posts[indexPath.row].list{
         cell.FavoriteButton.isHidden = false
         cell.unFavorite.isHidden = true
        }else{
            cell.FavoriteButton.isHidden = true
            cell.unFavorite.isHidden = false
            
        }
       
        return cell
    }
    
    
    
    @IBAction func ClickMenuButton(_ sender: UIButton) {
        Options.forEach{(UIButton) in
            UIView.animate(withDuration: 0.3, animations: {
                UIButton.isHidden = !UIButton.isHidden
                self.view.layoutIfNeeded()
            })
        }
     }
}
