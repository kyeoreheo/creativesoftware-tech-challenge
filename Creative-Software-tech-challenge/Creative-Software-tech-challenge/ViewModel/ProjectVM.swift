//
//  ProjectVM.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

struct ProjectVM {
    let project: Project?
//    let isOnCreationFlow: Bool

    init(project: Project?) {
        self.project = project
    }
    
    public func dateText(of date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        let day = Calendar.current.component(.day, from: date)
        var daySuffix = ""

        switch day {
        case 11...13: daySuffix = "th"
        default:
            switch day % 10 {
            case 1: daySuffix = "st"
            case 2: daySuffix = "nd"
            case 3: daySuffix = "rd"
            default: daySuffix = "th"
            }
        }
        
        formatter.dateFormat = "MMM d'\(daySuffix)', h:mm a"
        return formatter.string(from: date)
    }
    
    public func isOnCreationFlow() -> Bool {
        return project == nil
    }
}
