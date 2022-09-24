//
//  CategoriesTests.swift
//  
//
//  Created by Robert Nash on 08/09/2022.
//

import XCTest
@testable import Printer

final class CategoriesTests: XCTestCase {

    func testDefaultActiveCategories() throws {
        let printer = Printer(bundleIdentifier: "com.test.ok")
        let allCases = Category.allCases
        XCTAssertEqual(printer.activeCategories, Set(allCases))
    }
    
    func testExclude() throws {
        let excluded = Category.viewcycle
        let printer = Printer(bundleIdentifier: "com.test.ok", exclude: [excluded])
        let allCases = Category.allCases
        let activeCategories = Set(allCases).subtracting([excluded])
        XCTAssertEqual(printer.activeCategories, activeCategories)
    }
}
