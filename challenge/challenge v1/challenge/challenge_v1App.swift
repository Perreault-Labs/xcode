//
//  challenge_v1App.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI

@main
struct ChallengeAppApp: App {
    @StateObject var challengeManager = ChallengeManager() // Create and keep alive

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(challengeManager) // Inject into the environment
        }
    }
}
