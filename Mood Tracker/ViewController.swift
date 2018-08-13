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

        let today = Date()
        moodService.createEntry(mood: .none, date: today)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    // MARK: - LIFE CYCLE (REMOVE THIS COMMENT BEFORE PUBLISHING)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodService.loadEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let previouslySelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: previouslySelectedRow, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodService.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath) as! MoodEntryTableViewCell
        
        let entry = moodService.entries[indexPath.row]
        cell.configure(entry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            moodService.deleteEntry(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        default:
            break
        }
    }
}

extension ViewController: MoodDetailedViewControllerDelegate {
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didUpdateMoodEntryWith mood: MoodEntry.Mood, date: Date) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        moodService.updateEntry(mood: mood, date: date, at: selectedIndexPath.row)
        tableView.reloadData()
    }
    
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didCreateNewMoodEntryWith mood: MoodEntry.Mood, date: Date) {
        moodService.createEntry(mood: mood, date: date)
        tableView.reloadData()
    }
}
