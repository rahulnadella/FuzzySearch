/*
FuzzySearchTest.swift is available under the MIT license.
Copyright (c) 2015 Rahul Nadella https://github.com/rahulnadella
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions: The above copyright
notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
import XCTest

/*
The FuzzySearchTest is the test case for FuzzySearch
*/
class FuzzySearchTest: XCTestCase {
    
    private var fuzzySearch:FuzzySearch!
    /*
    Setup method for FuzzySearchTest
    */
    override func setUp()
    {
        super.setUp()
        fuzzySearch = FuzzySearch()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    /*
    TearDown method for FuzzySearchTest
    */
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        fuzzySearch = nil
    }
    
    /*
    The testFuzzySearch method tests the implementation of the FuzzySearch.search methods using case 
    sensitive and insensitive Strings.
    */
    func testFuzzySearch()
    {
        let helloWorld:String = "Hello World!"
        
        FuzzySearch().search("", stringToSearch: "")
        
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "Hello World!"), "Fuzzy Search 'Hello World!' returns TRUE")
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "Hello"), "Fuzzy Search 'Hello' returns TRUE")
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "World!"), "Fuzzy Search 'World!' returns TRUE")
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "ld!"), "Fuzzy Search 'ld!' returns TRUE")
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "Hell"), "Fuzzy Search 'Hell' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(helloWorld, stringToSearch: "HELLO"), "Fuzzy Search 'HELLO' returns FALSE")
        XCTAssertFalse(fuzzySearch.search(helloWorld, stringToSearch: "World?"), "Fuzzy Search 'World?' returns FALSE")
        XCTAssertFalse(fuzzySearch.search(helloWorld, stringToSearch: "ld?"), "Fuzzy Search 'ld?' returns FALSE")
        XCTAssertTrue(fuzzySearch.search(helloWorld, stringToSearch: "HELLO", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'HELLO' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(helloWorld, stringToSearch: "HELLO", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'HELLO' returns FALSE")
    }
    
    /*
    The testFuzzySearchWithCaseSensitive method tests the implementation of the FuzzySearch.search only using 
    case sensitive Strings
    */
    func testFuzzySearchWithCaseSensitive()
    {
        let message:String = "This document specifies an Internet standards track protocol"
        let messageUppercase:String = message.uppercaseString
        
        XCTAssertTrue(fuzzySearch.search(message, stringToSearch: messageUppercase, isCaseSensitive: true), "Fuzzy Search (Case Sensitive) returns TRUE")
        XCTAssertFalse(fuzzySearch.search(message, stringToSearch: messageUppercase, isCaseSensitive: false), "Fuzzy Search (Case Sensitive) returns FALSE")
        XCTAssertTrue(fuzzySearch.search(message, stringToSearch: "DOCUMENT", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'DOCUMENT' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(message, stringToSearch: "DOCUMENT", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'DOCUMENT' returns FALSE")
        XCTAssertTrue(fuzzySearch.search(message, stringToSearch: "Rnet Standar", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'Rnet Standar' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(message, stringToSearch: "Rnet Standar", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'Rnet Standar' returns FALSE")
        XCTAssertTrue(fuzzySearch.search(message, stringToSearch: "aN", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'aN' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(message, stringToSearch: "aN", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'aN' returns FALSE")
        XCTAssertTrue(fuzzySearch.search(message, stringToSearch: "RDS", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'RDS' returns TRUE")
        XCTAssertFalse(fuzzySearch.search(message, stringToSearch: "RDS", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'RDS' returns FALSE")
    }
    /*
    The testFuzzySearchCount method tests the implementation of the FuzzySearch.search returning a the number of instances within the original String
    */
    func testFuzzySearchCount()
    {
        let testMessage:String = "The The And"
        
        XCTAssertEqual(fuzzySearch.search(testMessage, stringToSearch: "The", isCaseSensitive: true), 2)
        XCTAssertEqual(fuzzySearch.search(testMessage, stringToSearch: "THE", isCaseSensitive: false), 0)
        XCTAssertEqual(fuzzySearch.search(testMessage, stringToSearch: "T", isCaseSensitive: false), 2)
    }
    
    /*
    The testPerformanceExample tests the performance of FuzzySearch.search
    */
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measureBlock()
        {
            /* Test without case sensitive */
            self.testFuzzySearch()
            /* Test with case sensitive */
            self.testFuzzySearchWithCaseSensitive()
            /* Test with count */
            self.testFuzzySearchCount();
        }
    }

}
