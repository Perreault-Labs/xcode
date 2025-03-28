//
//  ContentView.swift
//  calculatrice
//
//  Created by Elliot Perreault on 2025-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nombre1: Int = 0
    @State private var nombre2: Int = 0
    @State private var résultat: Int = 0
    
    func CalculeSomme() {
        résultat = nombre1 + nombre2
    }
    
    var body: some View {
        VStack {
            TextField("Nombre 1", value: $nombre1, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("Nombre 2", value: $nombre2, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: CalculeSomme) {
                Text("Calculer la somme")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            
            Text("Résultat: \(résultat)")
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
