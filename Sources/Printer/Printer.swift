//
//  Logger.swift
//  NinjaBuild
//
//  Created by Robert Nash on 03/09/2022.
//

import Foundation
import OSLog

struct Printer {
    
    private let subsystem: String
    
    let activeCategories: Set<Category>
    
    init(bundleIdentifier: String, exclude: Set<Category> = []) {
        subsystem = bundleIdentifier
        activeCategories = Set(Category.allCases).subtracting(exclude)
    }
    
    @MainActor
    lazy var viewcycle = makeLogger(.viewcycle)
    
    @MainActor
    lazy var network = makeLogger(.network)
    
    private func makeLogger(_ category: Category) -> Logger {
        switch activeCategories.contains(category) {
        case true: return Logger(subsystem: subsystem, category: category.rawValue)
        case false: return Logger(.disabled)
        }
    }
}
