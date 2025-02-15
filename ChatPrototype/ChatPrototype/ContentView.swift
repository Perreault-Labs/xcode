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
            .font(.title)
            .padding()
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
    }
}

extension View {
    func applyTextStyle(backgroundColor: Color) -> some View {
        self.modifier(TextStyleModifier(backgroundColor: backgroundColor))
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "message")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Salut, ça va ?")
                .applyTextStyle(backgroundColor: Color.blue)
            Text("Ça va bien et toi ?")
                .applyTextStyle(backgroundColor: Color.gray)
            
        }
    }
}

#Preview {
    ContentView()
}
