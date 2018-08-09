//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moodService = MoodEntryService()
    
    // MARK: - RETURN VALUES (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    // MARK: - VOID METHODS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    // MARK: - IBACTIONS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func pressAddEntry(_ button: UIBarButtonItem) {
//
//        let today = Date()
//        moodService.createEntry(mood: .none, date: today)
    }
    
    // MARK: - LIFE CYCLE (REMOVE THIS COMMENT BEFORE PUBLISHING)


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodService.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood cell", for: indexPath) as! MoodTableViewCell
        
        let entry = moodService.entries[indexPath.row]
        cell.imageViewMoodColor.backgroundColor = entry.mood.colorValue
        cell.labelMoodTitle.text = entry.mood.stringValue
        cell.labelMoodDate.text = entry.date.stringValue
        
        return cell
    }
}
