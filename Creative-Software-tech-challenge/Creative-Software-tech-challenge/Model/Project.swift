//
//  Project.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

struct Project {
    var title: String? = nil
    var date: Date? = nil
    var description: String? = nil
    var thumbNail = UIImage(named: "placeholder")
    var color: UIColor? = nil
    var isOnCreationFlow: Bool = true
}
