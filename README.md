# FuzzySearch

Concept
==============================

The FuzzySearch project provides a utility class to find an approximate match for a specific character set. (Future implementations will be added to scrutinize the closeness of the match.) 

Usage
-------------------------------
let message:String = "Swift is a new programming language for iOS and OS X apps that builds on the best of C and Objective-C, without the constraints of C compatibility."

***CASE-INSENSITIVE***

    FuzzySearch().search(message, stringToSearch:"Swift")

***CASE-SENSITIVE***

    FuzzySearch().search(message, stringToSearch:"SWIFT", isCaseSensitive:true)
