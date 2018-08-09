//
//  MoodDetailedViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MoodDetailedViewController: UIViewController {
    
    // MARK: - RETURN VALUES (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    // MARK: - VOID METHODS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    // MARK: - IBACTIONS (REMOVE THIS COMMENT BEFORE PUBLISHING)
    
    @IBOutlet weak var buttonAmazingMood: UIButton!
    @IBOutlet weak var buttonGoodMood: UIButton!
    @IBOutlet weak var buttonNeutralMood: UIButton!
    @IBOutlet weak var buttonBadMood: UIButton!
    @IBOutlet weak var buttonTerribleMood: UIButton!
    @IBAction func pressMood(_ button: UIButton) {
        //TODO: switch on button.tag
    }
    
    
    @IBOutlet weak var segmentDate: UISegmentedControl!
    @IBAction func segmentDidChangeValue(_ sender: UISegmentedControl) {
        //TODO: show and hide date picker
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePickerDidChangeValue(_ sender: UIDatePicker) {
        
    }
    
    // MARK: - LIFE CYCLE (REMOVE THIS COMMENT BEFORE PUBLISHING)

}
