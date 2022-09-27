//
//  FormattingCommand.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/27.
//

import SwiftUI

struct FormattingCommand : Commands {
    var body: some Commands {
#if os(macOS)
        CommandMenu("Format"){
            Menu("font") {
                Section("Font") {
                    Button("Larger +", action: {
                        print("font ++")
                    })
                    .keyboardShortcut("+", modifiers: [.command,.shift])
                    
                    Button("Smaller -", action: {
                        print("font --")
                    }).keyboardShortcut("-", modifiers: [.command,.shift])
                    
                }
            }
            Divider().padding(.horizontal, 10)
            Menu("Text") {
                Section("Text") {
                    Button("text") {
                        print("text menu...")
                    }
                }
            }
        }
#endif
    }
}
