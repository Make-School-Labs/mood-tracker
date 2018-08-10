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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show new entry":
                guard let entryDetailsViewController = segue.destination as? MoodDetailedViewController else {
                    
                    //NOTE: error handling
                    return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'MoodDetailedViewController'")
                }
                
                entryDetailsViewController.delegate = self
                
            case "show entry details":
                guard
                    let selectedCell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: selectedCell) else {
                        
                        //NOTE: error handling
                        return print("failed to locate index path from sender")
                }
                
                guard let entryDetailsViewController = segue.destination as? MoodDetailedViewController else {
                    
                    //NOTE: error handling
                    return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'MoodDetailedViewController'")
                }
                
                let entry = moodService.entries[indexPath.row]
                entryDetailsViewController.mood = entry.mood
                entryDetailsViewController.date = entry.date
                entryDetailsViewController.isEditingEntry = true
                
                entryDetailsViewController.delegate = self
                
            default: break
            }
        }
    }
    
    // MARK: - IBACTIONS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func pressAddEntry(_ button: UIBarButtonItem) {
//
//        let today = Date()
//        moodService.createEntry(mood: .none, date: today)
    }
    
    // MARK: - LIFE CYCLE (REMOVE THIS COMMENT BEFORE PUBLISHING)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodService.loadEntries()
    }
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

extension ViewController: MoodDetailedViewControllerDelegate {
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didUpdateMoodEntryWith mood: MoodEntry.Mood, date: Date) {
        
    }
    
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didCreateNewMoodEntryWith mood: MoodEntry.Mood, date: Date) {
        moodService.createEntry(mood: mood, date: date)
        tableView.reloadData()
    }
}
