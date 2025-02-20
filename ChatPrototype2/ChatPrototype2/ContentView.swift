//
//  ContentView.swift
//  ChatPrototype2
//
//  Created by Elliot Perreault on 2025-02-19.
//
//yiuiguyguyty

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Allo")
                .font(.largeTitle)
                .padding(10)
                .background(Color.blue)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .cornerRadius(30)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
