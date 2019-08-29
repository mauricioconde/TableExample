//
//  UITableViewController.swift
//  TableExample
//
//  Created by Mauricio Conde on 18/09/15.
//  Copyright © 2015 Swift example. All rights reserved.
//

import AVFoundation
import UIKit

class TableViewController: UITableViewController {
    
    let updateSound = URL(fileURLWithPath: Bundle.main.path(forResource: "update", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var refreshCntrl:UIRefreshControl!
    var items: [Note] = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure main view
        self.title = "Notes"
        tableView.rowHeight = 80.0
        
        // Create table view cells
        let nib = UINib(nibName: NoteCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NoteCell.cellID)
        
        configureRefreshCtrl()
        loadData()
    }
    
    // MARK: - Actions
    
    private func loadData() {
        if(items.count < 1 ){
            items.removeAll()
            for i in 1...10 {
                items.append(Note(title: "Note \(i)"))
            }
        }
    }
    
    @objc
    private func refreshData() {
        audioPlayer.play()
        refreshCntrl!.endRefreshing()
    }
    
    // MARK: - Configurations
    
    private func configureRefreshCtrl() {
        refreshCntrl = UIRefreshControl()
        refreshCntrl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshCntrl.attributedTitle = NSAttributedString(string: "Updating...")
        tableView.addSubview(refreshCntrl)
        
        // Audio
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: updateSound)
            audioPlayer.prepareToPlay()
        } catch {
            debugPrint("Error configuring audio player")
        }
    }
    
    // MARK: - UITableView delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellID) as? NoteCell
        
        if cell == nil {
            cell = NoteCell(style: .subtitle, reuseIdentifier: NoteCell.cellID)
        }
        
        let note = items[indexPath.row]
        cell!.titleLbl.text = note.title
        cell!.descLbl.text = note.shortDesc
        cell!.dateLbl.text = note.formattedDate
        cell!.iconImg.image = UIImage(named: note.img)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detailNote") as! DetailNoteViewController
        
        controller.note = items[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
