//
//  AssignWeekdayName.swift
//  StarWiki App
//
//  Created by Student on 4/21/26.
//

import Foundation

func AssignWeekdayName(day: Int) -> String {
    let weekdaySymbols = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    let mondayIndex = 1 // Spring 1 is a Monday
    let index = (mondayIndex + (day - 1)) % 7
    return weekdaySymbols[index]
}

func PrioritizingSchedule(for day: Int, season: Season) -> [ScheduleEvent] {
    if let specific = season.specificDays.first(where: { $0.days.contains(day) }) {
        return specific.events // return specific day schedule
    }
    
    let weekdayName = AssignWeekdayName(day: day)
    if let weekdayEvents = season.weekdays[weekdayName], !weekdayEvents.isEmpty {
        return weekdayEvents // return weekday based schedule
    }
    
    return season.defaultDays // if neither exist, return default schedule
}
