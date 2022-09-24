//
//  PrintManager.swift
//  
//
//  Created by Robert Nash on 09/09/2022.
//

import Foundation
import OSLog

@MainActor
public struct PrintManager {
    
    public let network: Logger
    public let viewcycle: Logger
    
    public init(bundleIdentifier: String, exclude: Set<Category> = []) {
        var printer = Printer(bundleIdentifier: bundleIdentifier, exclude: exclude)
        network = printer.network
        viewcycle = printer.viewcycle
    }
}
