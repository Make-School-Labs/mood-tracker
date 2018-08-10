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
        let unselectedColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        switch newMood {
        case .none:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .amazing:
            buttonAmazingMood.backgroundColor = newMood.colorValue
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .good:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = newMood.colorValue
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .neutral:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = newMood.colorValue
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = unselectedColor
        case .bad:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = newMood.colorValue
            buttonTerribleMood.backgroundColor = unselectedColor
        case .terrible:
            buttonAmazingMood.backgroundColor = unselectedColor
            buttonGoodMood.backgroundColor = unselectedColor
            buttonNeutralMood.backgroundColor = unselectedColor
            buttonBadMood.backgroundColor = unselectedColor
            buttonTerribleMood.backgroundColor = newMood.colorValue
        }
        
        mood = newMood
    }
    
    private func applyButtonStyle(to button: UIButton) {
        button.layer.cornerRadius = 4.0
    }
    
    // MARK: - IBACTIONS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    @IBAction func pressSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind to home", sender: true)
    }
    
    @IBAction func pressCancel(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind to home", sender: false)
    }
    
    @IBOutlet weak var buttonAmazingMood: UIButton! {
        didSet {
            applyButtonStyle(to: buttonAmazingMood)
        }
    }
    @IBOutlet weak var buttonGoodMood: UIButton! {
        didSet {
            applyButtonStyle(to: buttonGoodMood)
        }
    }
    @IBOutlet weak var buttonNeutralMood: UIButton! {
        didSet {
            applyButtonStyle(to: buttonNeutralMood)
        }
    }
    @IBOutlet weak var buttonBadMood: UIButton! {
        didSet {
            applyButtonStyle(to: buttonBadMood)
        }
    }
    @IBOutlet weak var buttonTerribleMood: UIButton! {
        didSet {
            applyButtonStyle(to: buttonTerribleMood)
        }
    }
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
