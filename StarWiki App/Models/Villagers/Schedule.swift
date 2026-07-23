//
//  Schedule.swift
//  StarWiki App
//
//  Created by Student on 4/21/26.
//

import Foundation

// schedule event
struct ScheduleEvent: Codable, Identifiable {
    var id: String { "\(time)-\(location)" }
    
    let time: String
    let location: String
}

// specific day schedule
struct SpecificDay: Codable, Identifiable {
    var id: String { days.map {String($0)} .joined(separator: "-") }
    
    let days: [Int]
    let events: [ScheduleEvent]
}

// Season Schedule
struct Season: Codable {
    let specificDays: [SpecificDay]
    let weekdays: [String:[ScheduleEvent]]
    let defaultDays: [ScheduleEvent]
}
