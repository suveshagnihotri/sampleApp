//
//  Article.swift
//  EZM-ios
//
//  Created by Suvesh Agnihotri on 25/04/2560 BE.
//  Copyright © 2560 BE Home. All rights reserved.
//

import Foundation
import Firebase

struct Article {
    
    let adUrl : String
    let author : String
    let date : String
    let description :String
    let ref : FIRDatabaseReference?
    let imageUrl : String
    let publisher : String
    let title : String
    let vedioUrl : String
    
    
    init(adUrl : String, author : String, date : String, description : String ,id : String, imageUrl : String, publisher : String , title : String, vedioUrl :String ) {
        self.adUrl = adUrl
        self.date = date
        self.description = description
        self.author=author
        self.imageUrl = imageUrl
        self.publisher = publisher
        self.title = title
        self.vedioUrl = vedioUrl
        self.ref=nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        adUrl = snapshotValue["adUrl"] as! String
        author = snapshotValue["author"] as! String
        date = snapshotValue["date"] as! String
        description = snapshotValue["description"] as! String
        imageUrl = snapshotValue["imageUrl"] as! String
        publisher = snapshotValue["publisher"] as! String
        title = snapshotValue["title"] as! String
        vedioUrl = snapshotValue["videoUrl"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "adUrl": adUrl,
            "author": author,
            "date": date,
            "description": description,

            "imageUrl": imageUrl,
            "publisher": publisher,
            "title": title,
            "vedioUrl": vedioUrl

        ]
    }

}
