//
//  ProjectVM.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

//enum ProjectSection: Int, CaseIterable {
//    case thumbNail
//    case date
//    case title
//    case description
//
//    var stringValue: String {
//        switch self {
//        case .thumbNail: return "ThumbNail"
//        case .date: return "Date"
//        case .title: return "Title"
//        case .description: return "Description"
//        }
//    }
//}

struct ProjectVM {
    let project: Project?
    let isOnCreationFlow: Bool

    init(project: Project?, isOnCreationFlow: Bool) {
        self.project = project
        self.isOnCreationFlow = isOnCreationFlow
    }
    
    public func dateText() -> String {
        return " "
    }
}
