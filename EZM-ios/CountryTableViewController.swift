//
//  CountryTableViewController.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 18/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit
import JLToast

protocol CountryDelegate{
    func countryName(name:String)
}


class CountryTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var countryData = ["India","Japan","China"]
    var delegate : CountryDelegate!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.dataSource=self
        countryTableView.delegate=self
        // Do any additional setup after loading the view.
        countryTableView.tableFooterView = UIView()
        //Country List 
        let locale = NSLocale.currentLocale()
        let countryArray = NSLocale.ISOCountryCodes()
        var unsortedCountryArray:[String] = []
        for countryCode in countryArray {
            let displayNameString = locale.displayNameForKey(NSLocaleCountryCode, value: countryCode)
            if displayNameString != nil {
                unsortedCountryArray.append(displayNameString!)
            }
        }
        countryData =  unsortedCountryArray.sort()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelClick(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doneClick(sender: AnyObject) {
        if let indexPath = countryTableView.indexPathForSelectedRow {
            delegate.countryName(countryData[indexPath.row])
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCellWithIdentifier("countryCell") as! CountryViewCellTableViewCell
        cell.countryName?.text=countryData[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }

}
