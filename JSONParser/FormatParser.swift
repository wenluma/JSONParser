//
//  FormatParser.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/23.
//

import Foundation

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
}
