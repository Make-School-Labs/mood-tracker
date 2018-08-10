//
//  MoodDetailedViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

protocol MoodDetailedViewControllerDelegate: class {
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didCreateNewMoodEntryWith mood: MoodEntry.Mood, date: Date)
    func moodDetailed(_ moodDetailed: MoodDetailedViewController, didUpdateMoodEntryWith mood: MoodEntry.Mood, date: Date)
}

class MoodDetailedViewController: UIViewController {
    
    var date = Date()
    var mood = MoodEntry.Mood.none
    var isEditingEntry = false
    
    weak var delegate: MoodDetailedViewControllerDelegate?
    
    // MARK: - RETURN VALUES (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    // MARK: - VOID METHODS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "unwind to home":
                guard let saveButtonTapped = sender as? Bool else {
                    return
                }
                
                if saveButtonTapped {
                    if isEditingEntry {
                        delegate?.moodDetailed(self, didUpdateMoodEntryWith: mood, date: date)
                    } else {
                        delegate?.moodDetailed(self, didCreateNewMoodEntryWith: mood, date: date)
                    }
                }
                
            default: break
            }
        }
    }
    
    private func updateUI() {
        updateMood(to: mood)
        datePicker.date = date
    }
    
    private func updateMood(to newMood: MoodEntry.Mood) {
        switch newMood {
        case .none:
            buttonAmazingMood.backgroundColor = nil
            buttonGoodMood.backgroundColor = nil
            buttonNeutralMood.backgroundColor = nil
            buttonBadMood.backgroundColor = nil
            buttonTerribleMood.backgroundColor = nil
        case .amazing:
            buttonAmazingMood.backgroundColor = newMood.colorValue
            buttonGoodMood.backgroundColor = nil
            buttonNeutralMood.backgroundColor = nil
            buttonBadMood.backgroundColor = nil
            buttonTerribleMood.backgroundColor = nil
        case .good:
            buttonAmazingMood.backgroundColor = nil
            buttonGoodMood.backgroundColor = newMood.colorValue
            buttonNeutralMood.backgroundColor = nil
            buttonBadMood.backgroundColor = nil
            buttonTerribleMood.backgroundColor = nil
        case .neutral:
            buttonAmazingMood.backgroundColor = nil
            buttonGoodMood.backgroundColor = nil
            buttonNeutralMood.backgroundColor = newMood.colorValue
            buttonBadMood.backgroundColor = nil
            buttonTerribleMood.backgroundColor = nil
        case .bad:
            buttonAmazingMood.backgroundColor = nil
            buttonGoodMood.backgroundColor = nil
            buttonNeutralMood.backgroundColor = nil
            buttonBadMood.backgroundColor = newMood.colorValue
            buttonTerribleMood.backgroundColor = nil
        case .terrible:
            buttonAmazingMood.backgroundColor = nil
            buttonGoodMood.backgroundColor = nil
            buttonNeutralMood.backgroundColor = nil
            buttonBadMood.backgroundColor = nil
            buttonTerribleMood.backgroundColor = newMood.colorValue
        }
        
        mood = newMood
    }
    
    // MARK: - IBACTIONS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    @IBAction func pressSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind to home", sender: true)
    }
    
    @IBAction func pressCancel(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind to home", sender: false)
    }
    
    @IBOutlet weak var buttonAmazingMood: UIButton!
    @IBOutlet weak var buttonGoodMood: UIButton!
    @IBOutlet weak var buttonNeutralMood: UIButton!
    @IBOutlet weak var buttonBadMood: UIButton!
    @IBOutlet weak var buttonTerribleMood: UIButton!
    @IBAction func pressMood(_ button: UIButton) {
        switch button.tag {
        case 0:
            updateMood(to: .amazing)
        case 1:
            updateMood(to: .good)
        case 2:
            updateMood(to: .neutral)
        case 3:
            updateMood(to: .bad)
        case 4:
            updateMood(to: .terrible)
        default:
            
            //NOTE: error handling
            print("unhandled button tag")
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePickerDidChangeValue(_ sender: UIDatePicker) {
        date = datePicker.date
    }
    
    // MARK: - LIFE CYCLE (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

}
