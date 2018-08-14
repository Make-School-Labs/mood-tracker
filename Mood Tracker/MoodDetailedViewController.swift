//
//  MoodDetailedViewController.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/14/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MoodDetailedViewController: UIViewController {
    var date: Date!
    var mood: MoodEntry.Mood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(date, mood)
    }
}
