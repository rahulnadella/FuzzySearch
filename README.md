# FuzzySearch

Overview
------------------------------

The FuzzySearch project provides a utility class to find an approximate match for a specific character set by either returning whether a match is found (true/false), the number of matches that exist (Int), the approximate matches found in the search context ([String]), and the fuzzy ranking of approximate matching of strings ranging from 0.0 (no match) to 1.0 (complete match). 

#####Version
>Version 1.1.0 -> Recompiled to iOS 8.3 to fix issues with new version <br/>
>Version 1.0 -> Design and Implementation of the FuzzySearch 

#####Build
>Master -> Only works on iOS 8.3 or greater

Usage
------------------------------

The FuzzySearch uses Cocoapods, the developer will need to add this to their project Podfile:

``pod 'FuzzySearch', '1.1.0'``

By importing the file -> FuzzySearch.swift into your project you be able to execute the methods within your the specific project. Examples are below of the listed functions within the class. Please refer to FuzzySearchTest.swift for examples.

***Initialization***

    let message:String = "Swift is a new programming language for iOS and OS X apps that builds on the best of C                                 and Objective-C, without the constraints of C compatibility."

***CASE-INSENSITIVE***

    FuzzySearch.search(originalString: message, stringToSearch:"Swift") -> true

***CASE-SENSITIVE***

    FuzzySearch.search(originalString: message, stringToSearch:"SWIFT", isCaseSensitive:false) -> false
    FuzzySearch.search(originalString: message, stringToSearch:"SWIFT", isCaseSensitive:true) -> true
    
***CASE-INSENSITIVE (COUNT)***

    FuzzySearch.search(originalString: message, stringToSearch:"the") -> 2
    
***CASE-SENSITIVE (COUNT)***

    FuzzySearch.search(originalString: message, stringToSearch:"THE", isCaseSensitive:false) -> 0
    FuzzySearch.search(originalString: message, stringToSearch:"THE", isCaseSensitive:true) -> 2

***CASE-INSENSITIVE (ARRAY)***

    FuzzySearch.search(originalString: message, stringToSearch"C", isCaseSensitive:false) -> ["C", "Objective-C", "C"]
    
***SCORE***

    FuzzySearch.search(originalString: message, stringToMatch: message) -> 1.0
    FuzzySearch.search(originalString: message, stringToMatch: "acx") -> 0.0
    FuzzySearch.search(originalString: "hello world", stringToMatch: "hello", fuzzines: 0.5) -> 0.913636363636364
    FuzzySearch.search(originalString: "hello world", stringToMatch: "hello wor1", fuzziness: 0.5) -> 0.608181818181818

License
------------------------------

*MIT License* --> A short, permissive software license. Basically, you can do whatever you want as long as you include the original copyright and license notice in any copy of the software/source.  There are many variations of this license in use.
