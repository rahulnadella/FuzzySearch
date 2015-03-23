# FuzzySearch

Introduction
------------------------------

The FuzzySearch project provides a utility class to find an approximate match for a specific character set. (Future implementations will be added to scrutinize the closeness of the match.) 

Usage
------------------------------
By importing the file -> FuzzySearch.swift into your project you be able to execute the methods within the class.

***Initialization***

    let message:String = "Swift is a new programming language for iOS and OS X apps that builds on the best of C                                 and Objective-C, without the constraints of C compatibility."

***CASE-INSENSITIVE***

    FuzzySearch().search(message, stringToSearch:"Swift") -> true

***CASE-SENSITIVE***

    FuzzySearch().search(message, stringToSearch:"SWIFT", isCaseSensitive:false) -> false
    FuzzySearch().search(message, stringToSearch:"SWIFT", isCaseSensitive:true) -> true
    
***CASE-INSENSITIVE (COUNT)***

    FuzzySearch().search(message, stringToSearch:"the") -> 2
    
***CASE-SENSITIVE (COUNT)***

    FuzzySearch().search(message, stringToSearch:"THE", isCaseInsensitive:false) -> 0
    FuzzySearch().search(message, stringToSearch:"THE", isCaseInsensitive:true) -> 2
