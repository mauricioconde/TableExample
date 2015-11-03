//
//  DetailNoteViewController.swift
//  TableExample
//
//  Created by Mauricio Conde Xinastle on 29/10/15.
//  Copyright © 2015 Swift example. All rights reserved.
//

import UIKit

class DetailNoteViewController: UIViewController {
    //MARK:- Attributes
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var iconImg: UIImageView!
    var note: Note!
    
    
    
    
    //MARK:- Class methods
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    
    
    
    //MARK:- Custom methods
    func config(){
        if(note != nil){
            if(titleLbl != nil){ titleLbl.text = note.title }
            if(descLbl != nil){ descLbl.text = note.fullDesc}
            if(dateLbl != nil){ dateLbl.text = Note.formatDate(note.createdTime)}
            if(iconImg != nil){ iconImg.image = UIImage(named: note.img)}
        }
    }
}
