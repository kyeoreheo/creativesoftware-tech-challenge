//
//  Project.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

struct Project {
    let title: String
    let date: Date
    let description: String
    let thumbNail: UIImage?
    let color: UIColor?
    let isOnCreationFlow: Bool
    let posibleColors: [UIColor] = [.picker1, .picker2, .picker3, .picker4, .picker5, .picker6]
}
