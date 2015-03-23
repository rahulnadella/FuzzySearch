//
//  FuzzySearchTest.swift
//  FuzzySearch
//
//  Created by Rahul Nadella on 3/19/15.
//
//

import UIKit
import XCTest
import FuzzySearch

class FuzzySearchTest: XCTestCase {

    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFuzzySearchInsensitive()
    {
        let helloWorld:String = "Hello World!"
        
        FuzzySearch.search(helloWorld, stringToSearch: "Hello World!")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
