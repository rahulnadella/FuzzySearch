/*
FuzzySearch.swift is available under the MIT license.
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

/*
In computer science, approximate string matching (often colloquially referred
to as fuzzy string searching) is the technique of finding strings that match a
pattern approximately (rather than exactly). The problem of approximate string
matching is typically divided into two sub-problems: finding approximate substring
matches inside a given string and finding dictionarystrings that match the
pattern approximately.

The FuzzySearch provides an implementation to search and match a pattern approximately
will return whether the character set is found or not by a Boolean or Integer value.
*/
public class FuzzySearch
{
    /*
    The FuzzySearch.search method returns a Boolean of TRUE if the stringToSearch for
    is found in the originalString otherwise FALSE. This search is not case sensitive.
    
    @param originalString
            The original contents that is going to be searched
    @param stringToSearch
            The specific contents to search for
    @return
            A Boolean of TRUE if found otherwise FALSE for not found
    */
    public func search<T : Equatable>(var originalString: T, var stringToSearch: T) -> Bool
    {
        return search(originalString, stringToSearch: stringToSearch, isCaseSensitive: false)
    }
    
    /*
    The FuzzySearch.search method returns a Boolean of TRUE if the stringToSearch for
    is found in the originalString otherwise FALSE. This search does search for case sensitive 
    Strings by using a Boolean value to indicate what kind of search to use.
    
    @param originalString
            The original contents that is going to be searched
    @param stringToSearch
            The specific contents to search for
    @param isCaseSensitive
            A Boolean value to indicate whether to use case sensitive or case 
            insensitive search parameters
    @return
            A Boolean of TRUE if found otherwise FALSE for not found
    */
    public func search<T : Equatable>(var originalString: T, var stringToSearch: T, isCaseSensitive: Bool) -> Bool
    {
        /* Decipher if the String to be searched for is found */
        var searchCount:Int = search(originalString, stringToSearch: stringToSearch, isCaseSensitive: isCaseSensitive)
        
        if searchCount > 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    /*
    The FuzzySearch.search method returns the number of instances a specific character 
    set is found with in a String object
    
    @param originalString
            The original contents that is going to be searched
    @param stringToSearch
            The specific contents to search for
    @param isCaseSensitive
            A Boolean value to indicate whether to use case sensitive or case
            insensitive search parameters
    @return
            A Boolean of TRUE if found otherwise FALSE for not found
    */
    public func search<T : Equatable>(var originalString: T, var stringToSearch: T, isCaseSensitive: Bool) -> Int
    {
        var tempOriginalString = String()
        var tempStringToSearch = String()
        /*
        Verify that the variables are Strings
        */
        if originalString is String && stringToSearch is String
        {
            tempOriginalString = originalString as String
            tempStringToSearch = stringToSearch as String
        }
        else
        {
            return 0
        }
        /*
        Either String is empty return false
        */
        if countElements(tempOriginalString) == 0 || countElements(tempStringToSearch) == 0
        {
            return 0
        }
        
        /*
        stringToSearch is greater than the originalString return false
        */
        if countElements(tempOriginalString) < countElements(tempStringToSearch)
        {
            return 0;
        }
        
        /*
        Check isCaseSensitive if true lowercase the contents of both strings
        */
        if isCaseSensitive
        {
            tempOriginalString = tempOriginalString.lowercaseString;
            tempStringToSearch = tempStringToSearch.lowercaseString;
        }
        
        var searchIndex : Int = 0
        var searchCount : Int = 0
        /*
        Search the contents of the originalString to determine if the stringToSearch can be found or not
        */
        for charOut in tempOriginalString
        {
            for (indexIn, charIn) in enumerate(tempStringToSearch)
            {
                if indexIn == searchIndex
                {
                    if charOut==charIn
                    {
                        searchIndex++
                        if searchIndex==countElements(tempStringToSearch)
                        {
                            searchCount++
                            searchIndex = 0
                        }
                        else
                        {
                            break
                        }
                    }
                    else
                    {
                        break
                    }
                }
            }
        }
        return searchCount;
    }
}