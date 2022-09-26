//
//  ContentView.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/23.
//

import SwiftUI

extension Color {
    init(_ r: Int, _ g: Int, _ b: Int, _ a: Int = 0xFF) {
        let c = CGColor(red: CGFloat(r)/255.0,
                        green: CGFloat(g)/255.0,
                        blue: CGFloat(b)/255.0,
                        alpha: CGFloat(a)/255.0)
        self.init(cgColor: c)
    }
    
    // ARGB
    init(_ hex: Int) {
        self.init((hex >> 16) & 0xFF, (hex >> 8) & 0xFF, hex & 0xFF, (hex >> 24) & 0xFF)
    }
    
    init(_ hex: String) {
        var input = hex
        input = input.replacingOccurrences(of: "#", with: "")
        input = input.replacingOccurrences(of: "0x", with: "");
        input = input.replacingOccurrences(of: "0X", with: "");
        if input.count == 6 {
            input = "FF" + input
        }
        let number = Int(hex, radix: 16) ?? 0
        self.init(number)
    }
}

struct ContentView: View {
    let key = KeyEquivalent("+")
    @State var sourceText: String = "{\"a\":1}"
    @State var destText: String = "json format";
    @State var showToast: Bool = false
    @State var size: CGFloat = 15
    @State var font : Font = .system(size: 15)
    
    var body: some View {
        VStack {
            HStack {
                Button("字体大") {
                    size += 2
                    print("font +: \(size)")
                    font = .system(size: size)
                }.keyboardShortcut(key,
                                   modifiers: [.shift, .command])
                Button("字体小") {
                    size -= 2
                    print("font +: \(size)")
                    font = .system(size: size)
                }.keyboardShortcut(KeyEquivalent("-"),
                                   modifiers: [.shift, .command])
                
                Button("check") {
                    let result = FormatParser.checkJSONObject(sourceText)
                    showToast = result
                    print("check json: \(result)")
                }.colorMultiply(showToast ? .green : .red)
                Button("格式化") {
                    print("format json")
                }
                Button("压缩") {
                    print("compression json")
                    destText = FormatParser.compress(sourceText)
                }
                Button("转义") {
                    print("convert json to string")
                    destText = FormatParser.textConvert(sourceText)
                }
                Button("取消转义") {
                    print("convert string to json")
                    destText = FormatParser.jsonString(from:sourceText)
                }
                Button(">>") {
                    print("text to json: \(sourceText)")
                    destText = FormatParser.textToJSON(sourceText);
                }
                Button("<<") {
                    if let result = FormatParser.textToJSONObject(sourceText) {
                        print(result)
                    } else {
                        print("failed to parser")
                    }
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            HStack {
                TextEditor(text: $sourceText).font(font).padding()
                TextEditor(text: $destText).font(font).padding()
            }
            Text("JSON Format")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
