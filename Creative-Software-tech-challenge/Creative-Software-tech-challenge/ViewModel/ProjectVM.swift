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
    let title: String
    let date: Date
    let description: String
    let thumbNail: UIImage?
    let color: UIColor?
    let isOnCreationFlow: Bool

    init(project: Project, isOnCreationFlow: Bool) {
        title = project.title
        date = project.date
        description = project.description
        thumbNail = project.thumbNail
        self.isOnCreationFlow = isOnCreationFlow//project.isOnCreationFlow
        color = project.color
    }
    
    public func dateText() -> String {
        return " "
    }
}
