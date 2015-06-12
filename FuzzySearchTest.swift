/*
The MIT License (MIT) - FuzzySearchTest.swift

Copyright (c) 2015 Rahul Nadella https://github.com/rahulnadella

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import Foundation
import XCTest

/*
The FuzzySearchTest is the test case for FuzzySearch
*/
class FuzzySearchTest: XCTestCase
{
    /*
    Setup method for FuzzySearchTest
    */
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    /*
    TearDown method for FuzzySearchTest
    */
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /*
    The testFuzzySearch method tests the implementation of the FuzzySearch.search methods using case 
    sensitive and insensitive Strings.
    */
    func testFuzzySearch()
    {
        let helloWorld:String = "Hello World!"
        
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "Hello World!"), "Fuzzy Search 'Hello World!' returns TRUE")
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "Hello"), "Fuzzy Search 'Hello' returns TRUE")
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "World!"), "Fuzzy Search 'World!' returns TRUE")
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "ld!"), "Fuzzy Search 'ld!' returns TRUE")
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "Hell"), "Fuzzy Search 'Hell' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: helloWorld, stringToSearch: "HELLO"), "Fuzzy Search 'HELLO' returns FALSE")
        XCTAssertFalse(FuzzySearch.search(originalString: helloWorld, stringToSearch: "World?"), "Fuzzy Search 'World?' returns FALSE")
        XCTAssertFalse(FuzzySearch.search(originalString: helloWorld, stringToSearch: "ld?"), "Fuzzy Search 'ld?' returns FALSE")
        XCTAssertTrue(FuzzySearch.search(originalString: helloWorld, stringToSearch: "HELLO", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'HELLO' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: helloWorld, stringToSearch: "HELLO", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'HELLO' returns FALSE")
    }
    
    /*
    The testFuzzySearchCountWithoutCaseSensitive method tests the implementation of the FuzzySearch.search which returns count the number of characters which exist within the original character set
    */
    func testFuzzySearchCountWithouCaseSensitive()
    {
        let countMessage = "si s S S s si"
        
        XCTAssertEqual(FuzzySearch.search(originalString: countMessage, stringToSearch: "s"), 4)
        XCTAssertEqual(FuzzySearch.search(originalString: countMessage, stringToSearch: "S"), 2)
        XCTAssertEqual(FuzzySearch.search(originalString: countMessage, stringToSearch: "s", isCaseSensitive: true), 6)
    }
    
    /*
    The testFuzzySearchWithCaseSensitive method tests the implementation of the FuzzySearch.search only using 
    case sensitive Strings
    */
    func testFuzzySearchWithCaseSensitive()
    {
        let message:String = "This document specifies an Internet standards track protocol"
        let messageUppercase:String = message.uppercaseString
        
        XCTAssertTrue(FuzzySearch.search(originalString: message, stringToSearch: messageUppercase, isCaseSensitive: true), "Fuzzy Search (Case Sensitive) returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: message, stringToSearch: messageUppercase, isCaseSensitive: false), "Fuzzy Search (Case Sensitive) returns FALSE")
        XCTAssertTrue(FuzzySearch.search(originalString: message, stringToSearch: "DOCUMENT", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'DOCUMENT' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: message, stringToSearch: "DOCUMENT", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'DOCUMENT' returns FALSE")
        XCTAssertTrue(FuzzySearch.search(originalString: message, stringToSearch: "Rnet Standar", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'Rnet Standar' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: message, stringToSearch: "Rnet Standar", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'Rnet Standar' returns FALSE")
        XCTAssertTrue(FuzzySearch.search(originalString: message, stringToSearch: "aN", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'aN' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: message, stringToSearch: "aN", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'aN' returns FALSE")
        XCTAssertTrue(FuzzySearch.search(originalString: message, stringToSearch: "RDS", isCaseSensitive: true), "Fuzzy Search (Case Sensitive) 'RDS' returns TRUE")
        XCTAssertFalse(FuzzySearch.search(originalString: message, stringToSearch: "RDS", isCaseSensitive: false), "Fuzzy Search (Case Sensitive) 'RDS' returns FALSE")
    }
    /*
    The testFuzzySearchCount method tests the implementation of the FuzzySearch.search returning a the number of instances within the original String
    */
    func testFuzzySearchCount()
    {
        let testMessage:String = "The The And"
        
        XCTAssertEqual(FuzzySearch.search(originalString: testMessage, stringToSearch: "The", isCaseSensitive: true), 2)
        XCTAssertEqual(FuzzySearch.search(originalString: testMessage, stringToSearch: "THE", isCaseSensitive: false), 0)
        XCTAssertEqual(FuzzySearch.search(originalString: testMessage, stringToSearch: "T", isCaseSensitive: false), 2)
    }
    /*
    The testFuzzySearchArray method tests the implementation of the FuzzySearch.search that returns an Array of Strings that match the character set being searched.
    */
    func testFuzzySearchArray()
    {
        let message:String = "This document specifies an Internet standards track protocol aN"
        let messageUppercase:String = message.uppercaseString
        
        XCTAssertEqual(FuzzySearch.search(originalString: "", stringToSearch: "", isCaseSensitive: false), [String]())
        XCTAssertEqual(FuzzySearch.search(originalString: "", stringToSearch: message, isCaseSensitive: false), [String]())
        XCTAssertEqual(FuzzySearch.search(originalString: message, stringToSearch: "an", isCaseSensitive: true), ["an", "standards", "an"])
        XCTAssertEqual(FuzzySearch.search(originalString: messageUppercase, stringToSearch: "an", isCaseSensitive: false), [String]())
        XCTAssertEqual(FuzzySearch.search(originalString: message, stringToSearch: "aN", isCaseSensitive: true), ["an", "standards", "an"])
        XCTAssertEqual(FuzzySearch.search(originalString: message, stringToSearch: "aN", isCaseSensitive: false), ["aN"])
    }
    /*
    The testScore method tests the implementation of the score method returning the approximate matching score comparing to string arguments
    */
    func testScore()
    {
        let helloWorld:String = "hello world"
        
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "axl"), 0.0)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "ow"), 0.504545454545455, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "e"), 0.259090909090909, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "h"), 0.586363636363636, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "he"), 0.622727272727273, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hel"), 0.659090909090909, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hell"), 0.695454545454545, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello"), 0.731818181818182, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello worl"), 0.913636363636364, accuracy: 0.00000001)
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello world"), 1.0)
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello wor1"), 0.0)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "h"), 0.586363636363636, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "H"), 0.531818181818182, accuracy: 0.00000001)
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "HiMi"), 0.0)
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "Hills"), 0.0)
        XCTAssertEqual(FuzzySearch.score(originalString: helloWorld, stringToMatch: "Hillsd"), 0.0)
        
        let he:String = "He"
        
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: he, stringToMatch: "h"), 0.675, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: he, stringToMatch: "H"), 0.75, accuracy: 0.00000001)
        
        let hello:String = "Hello"
        
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hello, stringToMatch: "hell"), 0.8475, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hello, stringToMatch: "hello"), 0.93, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hello, stringToMatch: "hello worl"), 0.0, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hello, stringToMatch: "hello world"), 0.0, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hello, stringToMatch: "hello wor1"), 0.0, accuracy: 0.00000001)

        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello worl", fuzziness:0.5), 0.913636363636364, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello world", fuzziness:0.5), 1.0, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: helloWorld, stringToMatch: "hello wor1", fuzziness:0.5), 0.608181818181818, accuracy: 0.00000001)
        
        let hillsdaleMichigan:String = "Hillsdale Michigan"
        
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hillsdaleMichigan, stringToMatch: "HiMi", fuzziness:0.5), 0.669444444444444, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hillsdaleMichigan, stringToMatch: "Hills", fuzziness:0.5), 0.661111111111111, accuracy: 0.00000001)
        XCTAssertEqualWithAccuracy(FuzzySearch.score(originalString: hillsdaleMichigan, stringToMatch: "Hillsd", fuzziness:0.5), 0.683333333333333, accuracy: 0.00000001)
    }
    
    /*
    The testPerformanceExample tests the performance of FuzzySearch.search
    */
    func testPerformanceExample()
    {
        /* This is an example of a performance test case. */
        self.measureBlock()
        {
            /* Test without case sensitive */
            self.testFuzzySearch()
            /* Test with case sensitive */
            self.testFuzzySearchWithCaseSensitive()
            /* Test count without case sensitive */
            self.testFuzzySearchCountWithouCaseSensitive()
            /* Test with count */
            self.testFuzzySearchCount()
            /* Test with array of Strings */
            self.testFuzzySearchArray()
            /* Test with fuzziness */
            self.testScore()
        }
    }

}
