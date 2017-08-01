//
//  ViewController.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 15/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let buttonData = ["Next","Next","Get Started"]
    @IBOutlet weak var buttonNext: UIButton!
    let dataImage = ["placeholder","pager2","intro3"]
    let lebel2data=["Catch news as it happen ,right here ,right now on EDM Bytes",
                    "Short, crisp to the point, because we understand your time is valuable",
                    "keep swiping left and right to navigate through articles"]
    let data = ["News As It Happens",
                "In Less than 60 words",
                "Swipe for More"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        buttonNext.layer.cornerRadius = 8.0
        myCollectionView.layer.cornerRadius = 8.0
        
        

    }
    
    override func viewDidAppear(animated: Bool) {
    
    }

    @IBAction func nextButtonAction(sender: AnyObject) {
        print("hey")
        let indexPaths = myCollectionView.indexPathsForVisibleItems()
        if indexPaths[0].item == 2 {
            if let registrationVc = storyboard?.instantiateViewControllerWithIdentifier("registrationVc") as? RegistrationViewController {
                self.presentViewController(registrationVc, animated: true, completion: nil)
            }
        }
        else {
            let indexPath = NSIndexPath(forItem: indexPaths[0].item + 1, inSection: indexPaths[0].section)
            myCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Right, animated: true)
  
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("Mycell", forIndexPath: indexPath) as! CollectionViewCell
        cell.mylabel?.text=data[indexPath.row]
        cell.mypagerImage?.image = UIImage(named: dataImage[indexPath.row])
        cell.lebel2?.text=lebel2data[indexPath.row]
        buttonNext.setTitle(buttonData[indexPath.row], forState: UIControlState.Normal)
        if indexPath.row==2{
            cell.skiplabel?.hidden=true
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height);
    }
    

}

