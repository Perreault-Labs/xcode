//
//  GalleryView.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI

struct GalleryView: View {
    @EnvironmentObject var challengeManager: ChallengeManager
    @State private var selectedChallenge: CompletedChallenge? = nil

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            Group {
                if challengeManager.completedChallenges.isEmpty {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Aucun challenge n'a encore été terminé !")
                            .font(.headline)
                            .padding(.top)
                        Text("Relevez un challenge pour voir vos souvenirs ici.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(challengeManager.completedChallenges) { completed in
                                GalleryItemView(completedChallenge: completed)
                                    .onTapGesture {
                                        selectedChallenge = completed
                                    }
                                    .contextMenu { // Add a context menu for deletion
                                        Button(role: .destructive) {
                                            challengeManager.deleteCompletedChallenge(completed)
                                        } label: {
                                            Label("Supprimer le souvenir", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Mes Souvenirs")
            .sheet(item: $selectedChallenge) { challengeDetail in
                CompletedChallengeDetailView(challenge: challengeDetail)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GalleryItemView: View {
    let completedChallenge: CompletedChallenge
    @State private var image: UIImage? = nil

    var body: some View {
        VStack {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Rectangle() // Placeholder
                    .fill(Color.gray.opacity(0.3))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                    .cornerRadius(8)
                    .overlay(ProgressView())
            }
            Text(completedChallenge.challengeTitle)
                .font(.caption)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Text(completedChallenge.dateCompleted, style: .date)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .onAppear {
            // Load image asynchronously
            DispatchQueue.global(qos: .userInitiated).async {
                let loadedImage = completedChallenge.getImage()
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }
    }
}


struct CompletedChallengeDetailView: View {
    let challenge: CompletedChallenge
    @State private var image: UIImage? = nil
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(.horizontal)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 250)
                        .cornerRadius(10)
                        .overlay(ProgressView())
                        .padding(.horizontal)
                }

                Text(challenge.challengeTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Text("Completed: \(challenge.dateCompleted, style: .date) at \(challenge.dateCompleted, style: .time)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                if let notes = challenge.notes, !notes.isEmpty {
                    Text("Your Notes:")
                        .font(.headline)
                        .padding(.top)
                        .padding(.horizontal)
                    Text(notes)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle("Memory Details")
        .navigationBarItems(trailing: Button("Done") {
            presentationMode.wrappedValue.dismiss()
        })
        .onAppear {
            DispatchQueue.global(qos: .userInitiated).async {
                let loadedImage = challenge.getImage()
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = ChallengeManager()
        // For preview, let's add a dummy completed challenge
        let dummyChallenge = PREDEFINED_CHALLENGES.first!
        // Create a dummy image (replace with a placeholder if you have one or handle nil)
        let dummyImage = UIImage(systemName: "star.fill") ?? UIImage()
        if let filename = PersistenceService.shared.saveImage(dummyImage, forChallengeId: dummyChallenge.id) {
             manager.completedChallenges = [
                 CompletedChallenge(challenge: dummyChallenge, photoFilename: filename)
             ]
        }

        return GalleryView().environmentObject(manager)
    }
}
