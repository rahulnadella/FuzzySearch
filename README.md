# FuzzySearch

Introduction
------------------------------

The FuzzySearch project provides a utility class to find an approximate match for a specific character set by either returning whether a match is found (true/false), the number of matches that exist (Int), or the approximate matches found in the search context ([String]). 

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

    
