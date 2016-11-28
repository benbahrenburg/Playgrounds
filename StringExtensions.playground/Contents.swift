//: String Extensions experiments

import UIKit

extension String {
    
    func contains(find: String, caseInsensitive : Bool = false) -> Bool{
        return self.range(of: find,options: caseInsensitive ? .caseInsensitive : []) != nil
    }
    
}

"Hello, playground".contains(find: "Hello")
"Hello, playground".contains(find: "hello")
"Hello, playground".contains(find: "hello", caseInsensitive:true)


extension String {
    
    func indexOf(searchFor: String, caseInsensitive : Bool = false) -> Int {
        let index = (self as NSString).range(of: searchFor,options: caseInsensitive ? .caseInsensitive : []).location
        return index == NSNotFound ? -1 : index
    }
    
}

"Hello, playground".indexOf(searchFor: "p")
"Hello, playground".indexOf(searchFor: "P")
"Hello, playground".indexOf(searchFor: "P",caseInsensitive: true)


extension String {
    
    var length : Int {
        return self.characters.count
    }
    
}

"Hello, playground".length


extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(
            in: CharacterSet.whitespacesAndNewlines
        )
    }
    
    func trimStart() -> String {
        if let range = rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines.inverted) {
            return self[range.lowerBound..<endIndex]
        }
        
        return self
    }
    
    func trimEnd() -> String {
        if let range = rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines.inverted, options: NSString.CompareOptions.backwards) {
            return self[startIndex..<range.upperBound]
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
        return (self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count == 0)
    }
    
}

" ".isEmpty()
"".isEmpty()
" a ".isEmpty()


extension String {
    
    func startsWith(prefix: String, caseInsensitive : Bool = false) -> Bool {
        return self.range(of: prefix, options: caseInsensitive ? .caseInsensitive : [])?.lowerBound == startIndex
    }
    
}

"Hello, playground".startsWith(prefix: "Hell")
"Hello, playground".startsWith(prefix: "hell")
"Hello, playground".startsWith(prefix: "hell", caseInsensitive:true)


extension String {

    func endsWith(_ suffix: String, caseInsensitive : Bool = false) -> Bool {
        return (caseInsensitive) ? self.lowercased().hasSuffix(suffix.lowercased()) :
            self.hasSuffix(suffix)
    }
    
}

"Hello, playground".endsWith("round")
"Hello, playground".endsWith("Round")
"Hello, playground".endsWith("Round",caseInsensitive:true)


extension String {
    
    func replace(before: String, with: String, caseInsensitive: Bool = false) -> String {
            return self.replacingOccurrences(of: before, with: with, options: caseInsensitive ? .caseInsensitive : [])
    }
    
}

"Hello, playground".replace(before: "Hello", with: "Goodbye")
"Hello, playground".replace(before: "o", with: "x")
"Hello, playground".replace(before: "hello", with: "Goodbye",caseInsensitive: true)


extension String {
    
    func split(separator: Character) -> [String] {
        return self.characters.split{$0 == separator}.map(String.init)
    }
    
}

" h e l l o ".split(separator: " ")
"Hello playground".split(separator: " ")

