//
//  ChallengeView.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var challengeManager: ChallengeManager
    @State private var showingImagePicker = false
    @State private var internalInputImage: UIImage? // Renamed to avoid conflict
    @State private var internalNotes: String = ""   // Renamed to avoid conflict

    // Allow initialization with an image and notes for previews or other contexts
    init(inputImage: UIImage? = nil, notes: String? = nil) {
        _internalInputImage = State(initialValue: inputImage)
        _internalNotes = State(initialValue: notes ?? "")
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Relevez le challenge ci-dessous")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top)
                            .padding(.bottom)

                        if let challenge = challengeManager.currentChallenge {
                            VStack(alignment: .center, spacing: 10) {
                                Text(challenge.title)
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.horizontal)

                                if let description = challenge.description, !description.isEmpty {
                                    Text(description)
                                        // ... (rest of description styling)
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding(.vertical, 40)
                            .padding(.horizontal, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(UIColor.systemGray6))
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            )
                            .padding(.horizontal)

                            if internalInputImage == nil { // Use internal state variable
                                Spacer(minLength: 20)
                            }

                            if internalInputImage != nil { // Use internal state variable
                                VStack(spacing: 15) {
                                    Text("Aperçu du souvenir:")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Image(uiImage: internalInputImage!) // Use internal state variable
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 150)
                                        .cornerRadius(8)
                                        .padding(.horizontal)

                                    Text("Add a note (optional):")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    TextEditor(text: $internalNotes) // Use internal state variable
                                        .frame(height: 70)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                        )
                                        .padding(.horizontal)
                                }
                                .padding(.vertical)
                            }
                        } else {
                            Spacer()
                            ProgressView("Loading challenge...")
                            Spacer()
                        }
                    }
                    .padding(.bottom, internalInputImage != nil ? 10 : 0) // Use internal state variable
                }

                if challengeManager.currentChallenge != nil {
                    Button(action: {
                        if internalInputImage == nil { // Use internal state variable
                            showingImagePicker = true
                        } else {
                            if let currentChallenge = challengeManager.currentChallenge, let imageToSave = internalInputImage { // Use internal state variable
                                challengeManager.completeChallenge(challenge: currentChallenge, image: imageToSave, notes: internalNotes.isEmpty ? nil : internalNotes) // Use internal state variable
                                internalInputImage = nil // Reset for next challenge
                                internalNotes = ""   // Reset for next challenge
                            }
                        }
                    }) {
                        Text(internalInputImage == nil ? "Sélectionnez une photo pour compléter" : "✓ Compléter") // Use internal state variable
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(internalInputImage == nil ? Color.accentColor : Color.green) // Use internal state variable
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .padding(.top, 5)
                }
            }
            .navigationTitle("Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $internalInputImage) // Bind to internal state variable
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .onAppear { // Corrected onAppear
                // If currentChallenge is nil when view appears, try to assign one
                if challengeManager.currentChallenge == nil {
                    challengeManager.assignNewChallenge()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
