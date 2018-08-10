//
//  MoodEntry.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import UIKit.UIColor

class MoodEntry: NSObject, NSCoding {
    
    //NOTE: should this be nested in MoodEntry?
    enum Mood: Int {
        case none
        case amazing
        case good
        case neutral
        case bad
        case terrible
        
        //NOTE: could use functions that return String
        var stringValue: String {
            switch self {
            case .none:
                return ""
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
            case .none:
                return .clear
            case .amazing:
                return .green
            case .good:
                return .blue
            case .neutral:
                return .gray
            case .bad:
                return .orange
            case .terrible:
                return .red
            }
        }
    }
    
    var mood: Mood
    var date: Date
    
    init(mood newMood: Mood, date newDate: Date) {
        mood = newMood
        date = newDate
        
        super.init()   
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mood.rawValue, forKey: "mood")
        aCoder.encode(date.timeIntervalSince1970, forKey: "date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        let moodValue = aDecoder.decodeInteger(forKey: "mood")
        guard let mood = Mood(rawValue: moodValue) else {
            return nil
        }
        self.mood = mood
        
        let dateValue = aDecoder.decodeDouble(forKey: "date")
        let date = Date(timeIntervalSince1970: dateValue)
        self.date = date
        
        super.init()
    }
}
