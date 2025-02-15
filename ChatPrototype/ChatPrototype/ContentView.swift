//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Elliot Perreault on 2025-02-14.
//

import SwiftUI

struct TextStyleModifier: ViewModifier {
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding()
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
            .padding(5)
    }
}

extension View {
    func applyTextStyle(backgroundColor: Color) -> some View {
        self.modifier(TextStyleModifier(backgroundColor: backgroundColor))
    }
}


struct ContentView: View {
    @State private var messages: [String] = [
    ]
    
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Image(systemName: "message")
                .font(.system(size: 60))
                .foregroundStyle(.tint)
                .frame(maxWidth: .infinity, alignment: .center)
            Divider()
            Spacer()
            Text("Salut, ça va ?")
                .applyTextStyle(backgroundColor: Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(messages, id: \.self) { message in
                Text(message)
                    .applyTextStyle(backgroundColor: Color.blue)
                                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            Divider()
            
            HStack {
                TextField("Message", text: $newMessage)
                    .font(.title)
                Image(systemName: "paperplane")
                    .font(.system(size: 24))
                    .foregroundStyle(.tint)
                    .onTapGesture {
                        if !newMessage.isEmpty {
                            messages.append(newMessage)
                            newMessage = ""
                        }
                    }
                   
            }.overlay(Rectangle()
                .frame(height: 2)
                .foregroundColor(.gray), alignment: .bottom)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
