//
//  MoodEntry.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import UIKit.UIColor

struct MoodEntry {
    
    //NOTE: should this be nested in MoodEntry?
    enum Mood: Int {
        case amazing
        case good
        case neutral
        case bad
        case terrible
        
        //NOTE: could use functions that return String
        var stringValue: String {
            switch self {
            case .amazing:
                return "Amazing"
            case .good:
                return "Good"
            case .neutral:
                return "Neutral"
            case .bad:
                return "Bad"
            case .terrible:
                return "Terrible"
            }
        }
        
        //NOTE: could use functions that return UIColor
        var colorValue: UIColor {
            switch self {
            case .amazing:
                return UIColor.green
            case .good:
                return UIColor.blue
            case .neutral:
                return UIColor.gray
            case .bad:
                return UIColor.orange
            case .terrible:
                return UIColor.red
            }
        }
    }
    
    var mood: Mood
    var date: Date
}
