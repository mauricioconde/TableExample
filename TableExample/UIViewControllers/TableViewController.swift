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
    //MARK: - Attributtes
    let updateSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("update", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var refreshCntrl:UIRefreshControl!
    var items : [AnyObject] = []
    let cellId = "MyCell"
    
    
    
    
    //MARK: - Class methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure main view
        self.title = "Notes"
        tableView.rowHeight = 80.0
        
        //Create table view cells
        let nib = UINib(nibName: "NoteCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellId)
        
        //configure refresh Ctrl
        configureRefreshCtrl()
        
        //load data
        loadData()
    }
    
    
    
    
    //MARK: - Custom Methods
    func configureRefreshCtrl(){
        refreshCntrl = UIRefreshControl()
        refreshCntrl!.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        refreshCntrl!.attributedTitle = NSAttributedString(string: "Updating...")
        self.tableView.addSubview(refreshCntrl!)
        
        //audio
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: updateSound)
            audioPlayer.prepareToPlay()
        }catch{
            print("Error")
        }
    }
    
    func loadData(){
        if(items.count < 1 ){
            items.removeAll()
            for(var i=0; i<10; i++) {
                items.append(Note(title: "Note \(i)"))
            }
        }
    }
    
    func refreshData(){
        audioPlayer.play()
        refreshCntrl!.endRefreshing()
    }
    
    
    
    
    //MARK: - UITableView methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: NoteCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? NoteCell
        
        if(cell == nil) {
            cell = NoteCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        
        cell?.loadItem(items[indexPath.row] as! Note)
        return cell!
    }
    
    
    
    
    // MARK: - Delegate methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Load the DetailViewController programmatically
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc:DetailNoteViewController = sb.instantiateViewControllerWithIdentifier("detailNote") as! DetailNoteViewController
        vc.note = items[indexPath.row] as! Note
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
