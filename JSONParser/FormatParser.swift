//
//  FormatParser.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/23.
//

import Foundation

extension String {
    var nsRange: NSRange {
        return NSRange(location: 0, length: self.count)
    }
    
    var range: Range<String.Index> {
        return self.startIndex ..< self.endIndex
    }
}

class FormatParser {
    class func textToJSON(_ text: String) -> String {
        var stack = [Character]()
        var dest = String()
        text.forEach {
            if  $0 == "]" || $0 == "}" {
                _ = stack.popLast()
                dest.append("\n")
                stack.forEach { _ in
                    dest.append("\t")
                }
            }
            dest.append($0)
            if ($0 == ",") {
                dest.append("\n")
                stack.forEach { _ in
                    dest.append("\t")
                }
            } else if $0 == "[" || $0 == "{" {
                dest.append("\n")
                stack.append($0)
                stack.forEach { _ in
                    dest.append("\t")
                }
            }
        }
        return dest
    }
    
    class func textConvert(_ text: String) -> String {
        return text.replacingOccurrences(of: "\"", with: "\\\"")
    }
    
    class func jsonString(from text: String) -> String {
        return text.replacingOccurrences(of: "\\\"", with: "\"");
    }
    
    class func compress(_ text: String) -> String {
        guard let regex = try? NSRegularExpression(pattern: "[\n\t ]") else {
            return text
        }
        return regex.stringByReplacingMatches(in: text, range: text.nsRange, withTemplate: "")
    }
    
    class func textToJSONObject(_ text: String) -> Any? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        guard let json = try? JSONSerialization.jsonObject(with: data) else {
            return nil
        }
        if let jsonResult = json as? Dictionary<String, AnyObject> {
            print(jsonResult.keys)
        }  else if let jsonResult = json as? Array<AnyObject> {
            print("array")
        }
        return json
    }
    
    class func checkJSONObject(_ text: String) -> Bool {
        guard let data = text.data(using: .utf8) else {
            return false
        }
        guard let json = try? JSONSerialization.jsonObject(with: data) else {
            return false
        }
        return JSONSerialization.isValidJSONObject(json)
    }
}
