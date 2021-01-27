//
//  ProjectVM.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

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
