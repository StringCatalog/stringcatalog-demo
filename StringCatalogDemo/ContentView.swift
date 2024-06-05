//
//  ContentView.swift
//  StringCatalogDemo
//
//  Created by Bill Richards on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var showIntro = false
    var body: some View {
        Button("test") {
            showIntro = true
        }
        .sheet(isPresented: $showIntro, content: {
            IntroView()
        })
    }
}

struct Feature: Identifiable {
    var id = UUID()
    var iconName: String
    var title: String
    var description: String
}

struct IntroView: View {
    var body: some View {
        let features: [Feature] = [
            Feature(iconName: "rectangle.stack", title: NSLocalizedString("Airplay Feature", comment: "airplay feature comment"), description: NSLocalizedString("Play your content on devices remotely.", comment: "")),
            Feature(iconName: "rectangle.stack", title: NSLocalizedString("Channels in Library", comment: "channel title"), description: NSLocalizedString("Easily access followed shows and more from your channels.", comment: "")),
            Feature(iconName: "play.rectangle", title: NSLocalizedString("Improved Up Next", comment: ""), description: NSLocalizedString("Resume episodes and remove any you want to skip.", comment: "")),
            Feature(iconName: "car", title: NSLocalizedString("CarPlay Updates", comment: ""), description: NSLocalizedString("Quickly pick up where you left off or find new shows in Browse.", comment: ""))
        ]
        
        NavigationView {
            VStack(spacing: 10) {
                Text("car count \(22)")
                Text("What's New in Orange Podcasts")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 25)
                    .padding(.top, 40)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(features, id: \.title) { feature in
                        FeatureView(iconName: feature.iconName, title: feature.title, description: feature.description)
                    }
                }
                
                Spacer()
                
                Image(systemName: "person.2.badge.key")
                    .foregroundColor(.purple)
                    .imageScale(.large)
                Text("The podcasts you purchase in Apple Podcasts Subscriptions are associated with your Apple ID. Your device trust score is used to prevent fraud. Data on your podcast listening and interactions is also used to improve and personalize the service and is not associated with your Apple ID. See how your data is managed...")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                
                Button(action: {}) {
                    Text("Continue")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                }
            }
            .background(Color.white)
            .navigationBarHidden(true)
            .padding(30)
        }
    }
}

struct FeatureView: View {
    var iconName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: iconName)
                .foregroundColor(.purple)
                .frame(width: 44, height: 44)
                .imageScale(.large)
                .font(.system(size: 24))
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
