//: Playground - noun: a place where people can play
//Soriyany


import UIKit
func isContainAlphebet(char:Character) -> Bool {
    let lowercaseChar:Character = "\(char)".lowercaseString.characters.first!
    let alphebet : Set<Character> =
        Set("abcdefghijklmnopqrstuvwxyz".characters)
    if alphebet.contains(lowercaseChar) {
        return true
    }
    return false
}
func firstCountDistAlpLast(str:String)->String{
    var letters = Set<Character>() // storing uniqueLetter
    var resultString = ""
    var isHasNewWord = true
    var countUniqueLetter = 0
    for (index, char) in str.characters.enumerate() { //Big O notation: O(n)
        var next_letter = ""
        let next_index = index + 1
        if next_index <  str.characters.count{ // checking for next letter
            let next_char:Character = str[str.startIndex.advancedBy(next_index)]
            next_letter = "\(next_char)"
        }
        if isContainAlphebet(char) == false{ // if not alphebet character, concatenates letter to resultString
            resultString += "\(char)"
            continue
        }
        /*
         when no next letter or next letter is not alphebet (base on the rules), concatenating the string base on the rules. Then reset isHasNewWord,countUniqueLetter, and letters before starting processing a new word
         */
        if next_letter == "" || (next_index <  str.characters.count && isContainAlphebet(next_letter.characters.first!) == false){
            if countUniqueLetter > 0 {
                resultString += "\(letters.count)"
            }
            resultString += "\(char)"
            isHasNewWord = true
            countUniqueLetter = 0
            letters.removeAll()
            continue
        }
        if isHasNewWord == true {// if there is a new word, concatenates first letter to resultString
            resultString += "\(char)"
            isHasNewWord = false
        }
        else{// if there is still the same word, when unique letter counting it and insert it to letter set
            let lowercaseChar:Character = "\(char)".lowercaseString.characters.first!
            if letters.contains(lowercaseChar) == false{
                countUniqueLetter += 1
                letters.insert(lowercaseChar)
            }
        }
    }
    return resultString
}
//TESTCASES RESULTS
firstCountDistAlpLast("automotive parts")
firstCountDistAlpLast("Automotive123 parts")
firstCountDistAlpLast("Automotive parts2test progra1, mingbBaAABB")
firstCountDistAlpLast("a")
firstCountDistAlpLast("ac")
firstCountDistAlpLast("aa,abccd1")
firstCountDistAlpLast("ana")
firstCountDistAlpLast("aaa")
firstCountDistAlpLast("1e1ee1a 1e1eeee1a")