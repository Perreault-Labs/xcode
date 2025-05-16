//
//  PersistenceService.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI // For UIImage for image saving

class PersistenceService {
    static let shared = PersistenceService()
    private init() {}

    private var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    private var completedChallengesFileURL: URL {
        documentsDirectory.appendingPathComponent("completedChallenges.json")
    }

    private var userProfileFileURL: URL {
        documentsDirectory.appendingPathComponent("userProfile.json")
    }

    // MARK: - Completed Challenges
    func saveCompletedChallenges(_ challenges: [CompletedChallenge]) {
        do {
            let data = try JSONEncoder().encode(challenges)
            try data.write(to: completedChallengesFileURL)
        } catch {
            print("Error saving completed challenges: \(error)")
        }
    }

    func loadCompletedChallenges() -> [CompletedChallenge] {
        guard let data = try? Data(contentsOf: completedChallengesFileURL) else { return [] }
        do {
            return try JSONDecoder().decode([CompletedChallenge].self, from: data)
        } catch {
            print("Error loading completed challenges: \(error)")
            return []
        }
    }

    // MARK: - User Profile
    func saveUserProfile(_ profile: UserProfile) {
        do {
            let data = try JSONEncoder().encode(profile)
            try data.write(to: userProfileFileURL)
        } catch {
            print("Error saving user profile: \(error)")
        }
    }

    func loadUserProfile() -> UserProfile {
        guard let data = try? Data(contentsOf: userProfileFileURL) else { return UserProfile() } // Return default if not found
        do {
            return try JSONDecoder().decode(UserProfile.self, from: data)
        } catch {
            print("Error loading user profile: \(error)")
            return UserProfile()
        }
    }

    // MARK: - Image Handling
    func saveImage(_ image: UIImage, forChallengeId challengeId: UUID) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        let filename = "\(challengeId.uuidString).jpg"
        let fileURL = documentsDirectory.appendingPathComponent(filename)

        do {
            try data.write(to: fileURL)
            return filename
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }

    func loadImage(filename: String) -> UIImage? {
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        guard let imageData = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: imageData)
    }

    func deleteImage(filename: String) {
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("Error deleting image: \(error)")
        }
    }
}
