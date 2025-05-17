//
//  Models.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI // For Image, if we decide to load it directly into the model later

// Represents a single challenge definition
struct Challenge: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var description: String? // Optional more detailed description

    // For predefined challenges
    init(id: UUID = UUID(), title: String, description: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
    }
}

// Represents a challenge completed by the user
struct CompletedChallenge: Identifiable, Codable, Hashable {
    let id: UUID
    let challengeId: UUID // To link back to the original Challenge if needed
    let challengeTitle: String
    var dateCompleted: Date
    var photoFilename: String // Filename of the image stored in Documents directory
    var notes: String? // Optional user notes for the memory

    // Initializer
    init(id: UUID = UUID(), challenge: Challenge, dateCompleted: Date = Date(), photoFilename: String, notes: String? = nil) {
        self.id = id
        self.challengeId = challenge.id
        self.challengeTitle = challenge.title
        self.dateCompleted = dateCompleted
        self.photoFilename = photoFilename
        self.notes = notes
    }

    // Helper to get the UIImage from the filename
    func getImage() -> UIImage? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let documentsDirectory = paths.first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(photoFilename)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image from disk: \(error)")
            return nil
        }
    }
}

// User Profile Data
struct UserProfile: Codable {
    var level: Int = 1
    var experiencePoints: Int = 0
    var completedChallengeIDs: Set<UUID> = [] // To track which predefined challenges are done

    // XP needed for next level (example logic)
    var xpForNextLevel: Int {
        return level * 50 // e.g., Level 1 -> 50 XP, Level 2 -> 100 XP
    }
}
