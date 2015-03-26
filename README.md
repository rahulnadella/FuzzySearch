# FuzzySearch

Introduction
------------------------------

The FuzzySearch project provides a utility class to find an approximate match for a specific character set by either returning whether a match is found (true/false), the number of matches that exist (Int), the approximate matches found in the search context ([String]), and the fuzzy ranking of approximate matching of strings ranging from 0.0 (no match) to 1.0 (complete match). 

Usage
------------------------------
By importing the file -> FuzzySearch.swift into your project you be able to execute the methods within the class.

***Initialization***

    let message:String = "Swift is a new programming language for iOS and OS X apps that builds on the best of C                                 and Objective-C, without the constraints of C compatibility."

***CASE-INSENSITIVE***

    FuzzySearch.search(message, stringToSearch:"Swift") -> true

***CASE-SENSITIVE***

    FuzzySearch.search(message, stringToSearch:"SWIFT", isCaseSensitive:false) -> false
    FuzzySearch.search(message, stringToSearch:"SWIFT", isCaseSensitive:true) -> true
    
***CASE-INSENSITIVE (COUNT)***

    FuzzySearch.search(message, stringToSearch:"the") -> 2
    
***CASE-SENSITIVE (COUNT)***

    FuzzySearch.search(message, stringToSearch:"THE", isCaseSensitive:false) -> 0
    FuzzySearch.search(message, stringToSearch:"THE", isCaseSensitive:true) -> 2

***CASE-INSENSITIVE (ARRAY)***

    FuzzySearch.search(message, stringToSearch"C", isCaseSensitive:false) -> ["C", "Objective-C", "C"]
    
***SCORE***

    FuzzySearch.search(originalString: message, stringToMatch: message) -> 1.0
    FuzzySearch.search(originalString: message, stringToMatch: "acx") -> 0.0
    FuzzySearch.search(originalString: "hello world", stringToMatch: "hello", fuzzines: 0.5) -> 0.913636363636364
    FuzzySearch.search(originalString: "hello world", stringToMatch: "hello wor1", fuzziness: 0.5) -> 0.608181818181818
