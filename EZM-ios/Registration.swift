//
//  Registration.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 19/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//
import Foundation
import Firebase


struct Registration{
    
    static let keyFullName = "FullName"
    static let keyEmail = "Email"
    static let keyCountry = "Country"
    static let keyIsAdmin = "IsAdmin"
    static let keyPassward = "Password"
    static let uniqueIntallKey = "UniqueInstallKey"
    
    let fullName:String
    let email:String
    let country:String
    let isAdmin:String
    let passward:String
    let uniqueInstallKey:String
    let firebaseReference: FIRDatabaseReference?

    
    init(fullName:String,email:String,country:String,isAdmin:String,passward:String,uniqueInstallKey:String){
        self.fullName=fullName
        self.email=email
        self.country=country
        self.isAdmin=isAdmin
        self.passward=passward
        self.uniqueInstallKey=uniqueInstallKey
        self.firebaseReference = nil

    }
    
    init(snapShot: FIRDataSnapshot){
        let snapshotValue = snapShot.value as! [String: Any]
        self.fullName=snapshotValue[Registration.keyFullName] as! String
        self.email=snapshotValue[Registration.keyEmail] as! String
        self.country=snapshotValue[Registration.keyCountry] as! String
        self.isAdmin=snapshotValue[Registration.keyIsAdmin] as! String
        self.passward=snapshotValue[Registration.keyPassward] as! String
        self.uniqueInstallKey=snapshotValue[Registration.uniqueIntallKey] as! String
        self.firebaseReference=snapShot.ref
    }
    
    func toDictionary()-> Any{
        return[
            Registration.keyCountry:self.country,
            Registration.keyEmail:self.email,
            Registration.keyFullName:self.fullName,
            Registration.keyIsAdmin:self.isAdmin,
            Registration.keyPassward:self.passward,
            Registration.uniqueIntallKey:self.uniqueInstallKey
        ]
    }
    
}



    
    

