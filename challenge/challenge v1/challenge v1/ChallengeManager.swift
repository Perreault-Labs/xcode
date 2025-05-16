//
//  ChallengeManager.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI

class ChallengeManager: ObservableObject {
    @Published var currentChallenge: Challenge?
    @Published var completedChallenges: [CompletedChallenge] = []
    @Published var userProfile: UserProfile = UserProfile()

    private let persistenceService = PersistenceService.shared

    init() {
        loadData()
        assignNewChallenge()
    }

    func loadData() {
        self.completedChallenges = persistenceService.loadCompletedChallenges()
        self.userProfile = persistenceService.loadUserProfile()
    }

    func saveData() {
        persistenceService.saveCompletedChallenges(completedChallenges)
        persistenceService.saveUserProfile(userProfile)
    }

    func assignNewChallenge() {
        let availableChallenges = PREDEFINED_CHALLENGES.filter { !userProfile.completedChallengeIDs.contains($0.id) }
        if let newChallenge = availableChallenges.randomElement() {
            currentChallenge = newChallenge
        } else {
            // All challenges completed, or no challenges defined
            // Could reset completedChallengeIDs here for replayability, or show a "all done" message
            currentChallenge = Challenge(title: "All challenges done for now!", description: "Check back later or try replaying.")
            // For re-playability, if you want to allow repeating challenges after all are done:
            // userProfile.completedChallengeIDs.removeAll()
            // saveData()
            // assignNewChallenge() // Try again
        }
    }

    func completeChallenge(challenge: Challenge, image: UIImage, notes: String? = nil) {
        guard let photoFilename = persistenceService.saveImage(image, forChallengeId: challenge.id) else {
            print("Failed to save image for challenge.")
            return
        }

        let newCompletedChallenge = CompletedChallenge(challenge: challenge, photoFilename: photoFilename, notes: notes)
        completedChallenges.append(newCompletedChallenge)
        userProfile.completedChallengeIDs.insert(challenge.id)

        // --- XP and Level Update Logic ---
        userProfile.experiencePoints += XP_PER_CHALLENGE

        // Loop to handle multiple level-ups from a single XP gain
        while userProfile.experiencePoints >= userProfile.xpForNextLevel {
            let xpRequiredForThisLevel = userProfile.xpForNextLevel // XP needed to pass the current level
            userProfile.experiencePoints -= xpRequiredForThisLevel   // Subtract the cost of leveling up
            userProfile.level += 1                                 // Increment level
            // userProfile.xpForNextLevel will now be recalculated based on the new level for the next loop check or display
        }
        // After the loop, userProfile.experiencePoints will be the remainder for the current (new) level.
        // It should not be negative if this logic is correct.

        saveData()
        assignNewChallenge()
    }
    
    func deleteCompletedChallenge(_ completedChallenge: CompletedChallenge) {
        if let index = completedChallenges.firstIndex(where: { $0.id == completedChallenge.id }) {
            // Remove from completed list
            completedChallenges.remove(at: index)
            // Mark as not completed in profile (optional, if you want it to reappear)
            userProfile.completedChallengeIDs.remove(completedChallenge.challengeId)
            // Delete the associated image
            persistenceService.deleteImage(filename: completedChallenge.photoFilename)
            saveData() // Save changes
        }
    }
}
