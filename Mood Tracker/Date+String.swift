//
//  Date+String.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .short)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInYesterday(self)
    }
}
