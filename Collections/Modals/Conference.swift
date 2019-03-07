//
//  Conference.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

class Conference: NSObject {
    var name = ""
    var startDate: Date?
    var durationDays = 0
    var speakers = [String]()
    var deletedSpeakers = [String]()
    
    init(name: String, start startDate: Date?, duration durationDays: Int, speakers: [String]) {
        super.init()
        self.name = name
        self.startDate = startDate
        self.durationDays = durationDays
        self.speakers = speakers.sorted{ $0 > $1 }
        deletedSpeakers = []
    }
    
    func deleteSpeaker(at index: Int) -> String? {
        guard index < speakers.count else {
            return nil
        }
        
        deletedSpeakers.append(speakers[index])
        return speakers.remove(at: index)
    }
    
    func restoreSpeaker() -> String? {
        guard !deletedSpeakers.isEmpty else {
            return nil
        }
        
        speakers.append(deletedSpeakers[0])
        return deletedSpeakers.remove(at: 0)
    } 
}

