//
//  CustomCell.swift
//  TableExample
//
//  Created by Mauricio Conde on 03/09/15.
//  Copyright (c) 2015 Swift example. All rights reserved.
//

import UIKit

@IBDesignable class NoteCell: UITableViewCell {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var iconImg: UIImageView!
    
    func loadItem(note: Note){
        titleLbl.text = note.title
        descLbl.text = note.shortDesc
        dateLbl.text = Note.formatDate(note.createdTime)
        iconImg.image = UIImage(named: note.img)
    }
    
}
