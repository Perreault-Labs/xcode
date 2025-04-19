//
//  ContentView.swift
//  image-width
//
//  Created by Elliot Perreault on 2025-03-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("test")
                .resizable()
                .frame(width: 300, height: 300)
            Image("test")
                .frame(width: 300, height: 300)
                .clipped()
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
