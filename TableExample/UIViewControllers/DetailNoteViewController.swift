//
//  DetailNoteViewController.swift
//  TableExample
//
//  Created by Mauricio Conde Xinastle on 29/10/15.
//  Copyright © 2015 Swift example. All rights reserved.
//

import UIKit

class DetailNoteViewController: UIViewController {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var iconImg: UIImageView!
    var note: Note!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK:- Configuration
    func configureView(){
        guard let note = note else { return }
        
        titleLbl.text = note.title
        descLbl.text = note.fullDesc
        dateLbl.text = note.formattedDate
        iconImg.image = UIImage(named: note.img)
    }
}
