//
//  Note.swift
//  TableExample
//
//  Created by Mauricio Conde on 18/09/15.
//

import UIKit

struct Note {
    var title: String
    let shortDesc: String
    let fullDesc: String
    let createdTime: Date
    let img: String
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        return dateFormatter.string(from: createdTime)
    }
    
    // MARK:- Initializer
    
    init(){
        title = "Note"
        shortDesc = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma"
        fullDesc = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu."
        createdTime = Date()
        img = "Note.png"
    }
    
    init(title: String){
        self.init()
        self.title = title
    }
}
