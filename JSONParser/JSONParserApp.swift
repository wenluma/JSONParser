//
//  JSONParserApp.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/23.
//

import SwiftUI
//SwifUI Mac Menus https://troz.net/post/2021/swiftui_mac_menus/

@main
struct JSONParserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().frame(minWidth: 500, maxWidth: .infinity,
                                minHeight: 500, maxHeight: .infinity,
                                alignment: .center)
        }.commands {
//            TextFormattingCommands()
            FormattingCommand()
            CommandMenu("My Top Menu") {
                Button("Sub Menu Item") { print("You pressed sub menu.") }
                    .keyboardShortcut("S")
            }
            CommandGroup(replacing: .pasteboard) {
                Button("Cut") { print("Cutting something...") }
                    .keyboardShortcut("X")
                Button("Copy") { print("Copying something...") }
                    .keyboardShortcut("C")
                Button("Paste") { print("Pasting something...") }
                    .keyboardShortcut("V")
                Button("Paste and Match Style") { print("Pasting and Matching something...") }
                    .keyboardShortcut("V", modifiers: [.command, .option, .shift])
                Button("Delete") { print("Deleting something...") }
                    .keyboardShortcut(.delete)
                Button("Select All") { print("Selecting something...") }
                    .keyboardShortcut("A")
            }
        }
    }
}
