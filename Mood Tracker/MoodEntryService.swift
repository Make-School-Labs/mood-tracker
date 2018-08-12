//
//  MoodEntryService.swift
//  Mood Tracker
//
//  Created by Erick Sanchez on 8/9/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation

class MoodEntryService {
    
    private(set) var entries: [MoodEntry] = []
    
    func createEntry(mood: MoodEntry.Mood, date: Date) {
        let newEntry = MoodEntry(mood: mood, date: date)
        
        entries.insert(newEntry, at: 0)
        sortEntries()
        save()
    }
    
    func loadEntries() {
        let ud = UserDefaults.standard
        
        //check if entries are saved from perviously
        if let entriesData = ud.data(forKey: Constants.UserDefaults.userEntries) {
            
            //NOTE: error handling, should this be an fatalError or a crash-less print statement?
            guard let entriesFromData = NSKeyedUnarchiver.unarchiveObject(with: entriesData) as? [MoodEntry] else {
                return print("entry data stored was not an array of MoodEntry")
            }
            
            entries = entriesFromData
            sortEntries()
        }
    }
    
    func updateEntry(mood newMood: MoodEntry.Mood, date newDate: Date, at index: Int) {
        let entryToUpdate = entries[index]
        entryToUpdate.mood = newMood
        entryToUpdate.date = newDate
        
        entries[index] = entryToUpdate
        sortEntries()
        save()
    }
    
    func deleteEntry(at index: Int) {
        entries.remove(at: index)
        save()
    }
    
    private func sortEntries() {
        entries.sort { (aEntry, bEntry) -> Bool in
            return aEntry.date.compare(bEntry.date) == .orderedDescending
        }
    }
    
    private func save() {
        let ud = UserDefaults.standard
        let entriesData = NSKeyedArchiver.archivedData(withRootObject: entries)
        ud.set(entriesData, forKey: Constants.UserDefaults.userEntries)
        ud.synchronize()
    }
}
