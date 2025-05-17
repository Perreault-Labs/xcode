//
//  ProfileView.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var challengeManager: ChallengeManager

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Vos progrès")) {
                    HStack {
                        Image("ProfileIcon") // Or a profile icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text("Niveau \(challengeManager.userProfile.level)")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            ProgressView(value: Float(challengeManager.userProfile.experiencePoints),
                                         total: Float(challengeManager.userProfile.xpForNextLevel)) {
                                Text("XP: \(challengeManager.userProfile.experiencePoints) / \(challengeManager.userProfile.xpForNextLevel)")
                            } currentValueLabel: {
                                Text("\(challengeManager.userProfile.experiencePoints)/\(challengeManager.userProfile.xpForNextLevel) XP")
                                    .font(.caption)
                            }
                            .padding(.top, 2)
                        }
                    }
                }

                Section(header: Text("Statistiques")) {
                    HStack {
                        Text("Challenges relevés:")
                        Spacer()
                        Text("\(challengeManager.completedChallenges.count)")
                    }
                }
                
                Section(header: Text("App Info")) {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.1")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Profil")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ChallengeManager())
    }
}
