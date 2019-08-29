//
//  CustomCell.swift
//  TableExample
//
//  Created by Mauricio Conde on 03/09/15.
//  Copyright (c) 2015 Swift example. All rights reserved.
//

import UIKit

@IBDesignable class NoteCell: UITableViewCell {
    static let nibName = "NoteCell"
    static let cellID = "NoteCell"
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var iconImg: UIImageView!
}
