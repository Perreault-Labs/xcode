//
//  ContentView.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var challengeManager: ChallengeManager

    var body: some View {
        TabView {
            ChallengeView()
                .tabItem {
                    Label("Challenge", systemImage: "target")
                }

            GalleryView()
                .tabItem {
                    Label("Souvenirs", systemImage: "photo.stack")
                }

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle")
                }
        }
        .onAppear {
            // This ensures data is loaded when the app starts or ContentView appears
            // ChallengeManager's init already calls loadData and assignNewChallenge
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChallengeManager()) // For preview
    }
}
