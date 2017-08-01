//
//  DetailViewController.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 24/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class DetailViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet var detailCollectionView: UICollectionView!
    var articles = [Article]()

    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.delegate=self
        detailCollectionView.dataSource=self
        detailCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
        ref.child("NewsArticles").observeSingleEventOfType(.Value, withBlock: { snapshot in
            var items: [Article] = []
            if !snapshot.exists() { return }
            for item in snapshot.children {
                print(snapshot.value)
                let articles = Article(snapshot: item as! FIRDataSnapshot)
                items.append(articles)
            }
            self.articles = items
            self.detailCollectionView.reloadData()
        })
        print(self.articles.count)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.articles.count
        return self.articles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("DetailCell", forIndexPath: indexPath) as! DetailCollectionViewCell
        let articledata = self.articles[indexPath.row]
        cell.detailImageView?.kf_setImageWithURL(NSURL(string: articledata.imageUrl)!)
        cell.detailDescription?.text=articledata.description
        cell.detailAuthor?.text=articledata.author
        cell.detailDate?.text=articledata.date
        cell.detailTitle?.text=articledata.title
        cell.textparentView?.layer.cornerRadius = 8.0
        return cell
    }
}
