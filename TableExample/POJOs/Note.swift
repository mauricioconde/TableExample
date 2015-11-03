//
//  Note.swift
//  TableExample
//
//  Created by Mauricio Conde on 18/09/15.
//  Copyright © 2015 Swift example. All rights reserved.
//

import UIKit

class Note {
    //MARK:- Attributes
    var title: String
    var shortDesc: String
    var fullDesc: String
    var createdTime: NSDate
    var img: String
    
    //MARK:- Initializer
    init(){
        title = "Note"
        shortDesc = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma"
        fullDesc = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu."
        createdTime = NSDate()
        img = "Note.png"
    }
    
    convenience init(title: String){
        self.init()
        self.title = title
    }
    
    
    
    
    //MAR:- Class methods
    class func formatDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        let s = dateFormatter.stringFromDate(date)
        return s
    }
}
