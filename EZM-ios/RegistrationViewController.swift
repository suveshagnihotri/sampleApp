//
//  RegistrationViewController.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 17/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import JLToast

class RegistrationViewController: UIViewController,UITextFieldDelegate, CountryDelegate {

    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var rView: UIView!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var confirmPassword: UITextField!
    var databaseRef : FIRDatabaseReference!
    var userInfo :[String : AnyObject]!
    var myColor : UIColor!
    var countryName :String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //country.delegate = self
        parentView?.backgroundColor = UIColor(white: 1, alpha: 0.8)

        country.tag = 100
        databaseRef=FIRDatabase.database().reference()
//        self.signInButton.enabled=false
        myColor = UIColor.grayColor()
        rView.layer.cornerRadius = 8.0
       enterButton.layer.cornerRadius = 8.0
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func countryName(name: String) {
        country.text=name
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.tag != 100 {
            let yPosition = view.frame.size.height - textField.frame.size.height - textField.frame.origin.y
            var x: CGFloat = 0.0;
            if yPosition < 400 {
                x = 400 - yPosition
            }
            print("\(textField.frame.origin.y) yPOsition = \(yPosition) x= \(x)")
            scrollView.setContentOffset(CGPointMake(scrollView.frame.origin.x, scrollView.frame.origin.y + x), animated: true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.tag != 100 {
        scrollView.setContentOffset(CGPointMake(scrollView.frame.origin.x, scrollView.frame.origin.y), animated: true)
        }
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField.tag == 100 {
            if let countryVC = storyboard?.instantiateViewControllerWithIdentifier("countryScene") as? CountryTableViewController {
                countryVC.delegate=self
                self.presentViewController(countryVC, animated: true, completion: nil)
            }
        }
        return true
    }
    
    func postUserData(userInfo :[String : AnyObject]){
        databaseRef.child("Users").childByAutoId().setValue(userInfo)
        
        }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    @IBAction func onClickEnterButton(sender: AnyObject) {
        print("Enter Button Click")
        let text = self.fullName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) ?? ""
        if text.characters.count == 0 {
            JLToast.makeText("Please enter fullname").show()
            return
        }
        let emailText = self.email.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) ?? ""
        if emailText.characters.count == 0 {
            JLToast.makeText("Please enter email").show()
            return
        }else{
            if isValidEmail(emailText){
            email.backgroundColor = UIColor.whiteColor()
            }else{
                JLToast.makeText("Please valid email").show()
                return
            }
        }
        
        let countryText = self.country.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) ?? ""
        if countryText.characters.count == 0 {
            JLToast.makeText("Please select Country").show()
            return
        }
        
        let passwardText = self.password.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) ?? ""
        if passwardText.characters.count == 0 {
            JLToast.makeText("Please enter passward").show()
            return
        }
        
        let CPasswardText = self.confirmPassword.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) ?? ""
        if CPasswardText.characters.count == 0 {
            JLToast.makeText("Please enter passward").show()
            return
        }else{
            if confirmPassword.text==password.text{
            confirmPassword.backgroundColor = UIColor.whiteColor()
            }else{
                JLToast.makeText("Please enter passward").show()
                return
            }
        }
        print(fullName.text!+email.text!+password.text!)

        if  country?.text=="" || fullName?.text=="" || email?.text!=="" || password?.text=="" || confirmPassword?.text==""{
            JLToast.makeText("All Field are manadatery").show()
         return
        }else{
            JLToast.makeText("data Sucessfully sent").show()
//            userInfo=["Country" : country.text!,
//                      "FullName" : fullName.text!,
//                      "email" : email.text!,
//                      "IsAdmin" : "No",
//                      "Passward" : password.text!,
//                      "UniqueInstallKey" :"hello"]
//            postUserData(userInfo)
        
            if let detailVc = storyboard?.instantiateViewControllerWithIdentifier("detailVc") as? DetailViewController {
                self.presentViewController(detailVc, animated: true, completion: nil)
            }
    
//        }

    }
  

}