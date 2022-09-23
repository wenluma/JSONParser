//
//  ContentView.swift
//  JSONParser
//
//  Created by milomiao on 2022/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var sourceText: String = "hello input json"
    @State var destText: String = "json format";
    
    var body: some View {
        VStack {
            HStack {
                Button("格式化") {
                    print("format json")
                }
                Button("压缩") {
                    print("compression json")
                }
                Button("转义") {
                    print("convert json to string")
                }
                Button(">>") {
                    print("text to json: \(sourceText)")
                    destText = FormatParser.textToJSON(sourceText);
                }
                Button("<<") {
                    print("json to text")
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            HStack {
                TextEditor(text: $sourceText).padding()
                TextEditor(text: $destText).padding()
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
