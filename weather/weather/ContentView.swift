//
//  ContentView.swift
//  weather
//
//  Created by Elliot Perreault on 2025-03-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
            }
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
            }
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
            }
        }.padding(10)
    }
}

#Preview {
    ContentView()
}


//HStack {
//    MétéoJournalière(jour: "Lundi", ilPleut: false, températureMax: 23)
//}

struct Icon {
    var id: String
    var color: Color
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var icon: Icon {
        if isRainy {
            return Icon(id: "cloud.rain.fill", color: .blue)
        } else {
            return Icon(id: "sun.max.fill", color: .yellow)
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: icon.id)
                .foregroundStyle(icon.color)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
        }
        .padding()
    }
}
