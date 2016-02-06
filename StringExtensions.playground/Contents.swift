//: String Extensions experiments

import UIKit

extension String {
    
    func contains(find: String, caseInsensitive : Bool = false) -> Bool{
        return self.rangeOfString(find,options: caseInsensitive ? .CaseInsensitiveSearch : []) != nil
    }
    
}

"Hello, playground".contains("Hello")
"Hello, playground".contains("hello")
"Hello, playground".contains("hello",caseInsensitive:true)


extension String {
    
    func indexOf(searchValue: String, caseInsensitive : Bool = false) -> Int {
        let index = (self as NSString).rangeOfString(searchValue,options: caseInsensitive ? .CaseInsensitiveSearch : []).location
        return index == NSNotFound ? -1 : index
    }
    
}

"Hello, playground".indexOf("p")
"Hello, playground".indexOf("P")
"Hello, playground".indexOf("P",caseInsensitive: true)


extension String {
    
    var length : Int {
        return self.characters.count
    }
    
}

"Hello, playground".length


extension String {
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
    }
    
    func trimStart() -> String {
        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet) {
            return self[range.startIndex..<endIndex]
        }
        
        return self
    }
    
    func trimEnd() -> String {
        if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
            return self[startIndex..<range.endIndex]
        }
        
        return self
    }
    
}

" h e l l o ".length
" h e l l o ".trim().length
"hello   ".trimEnd()
"   hello".trimStart()


extension String {
    
    func isEmpty() -> Bool {
        return (self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).characters.count == 0)
    }
    
}

" ".isEmpty()
"".isEmpty()
" a ".isEmpty()


extension String {
    
    func startsWith(prefix: String, caseInsensitive : Bool = false) -> Bool {
        return self.rangeOfString(prefix, options: caseInsensitive ? .CaseInsensitiveSearch : [])?.startIndex == startIndex
    }
    
}

"Hello, playground".startsWith("Hell")
"Hello, playground".startsWith("hell")
"Hello, playground".startsWith("hell",caseInsensitive:true)


extension String {

    func endsWith(suffix: String, caseInsensitive : Bool = false) -> Bool {
        return (caseInsensitive) ? self.lowercaseString.hasSuffix(suffix.lowercaseString) :
            self.hasSuffix(suffix)
    }
    
}

"Hello, playground".endsWith("round")
"Hello, playground".endsWith("Round")
"Hello, playground".endsWith("Round",caseInsensitive:true)


extension String {
    
    func replace(before: String, with: String, caseInsensitive: Bool = false) -> String {
            return self.stringByReplacingOccurrencesOfString(before, withString: with, options: caseInsensitive ? .CaseInsensitiveSearch : [])
    }
    
}

"Hello, playground".replace("Hello", with: "Goodbye")
"Hello, playground".replace("o", with: "x")
"Hello, playground".replace("hello", with: "Goodbye",caseInsensitive: true)


extension String {
    
    func split(separator: Character) -> [String] {
        return self.characters.split{$0 == separator}.map(String.init)
    }
    
}

" h e l l o ".split(" ")
"Hello playground".split(" ")

