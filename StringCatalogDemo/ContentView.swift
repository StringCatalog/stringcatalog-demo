//
//  ContentView.swift
//  StringCatalogDemo
//
//  Created by Bill Richards on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showIntro = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)
                
                VStack(spacing: 10) {
                    Text(LocalizedStringKey("String Catalog Demo"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(LocalizedStringKey("Explore the power of localization"))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    FeatureRow(iconName: "text.book.closed", text: LocalizedStringKey("Centralized string management"))
                    FeatureRow(iconName: "globe", text: LocalizedStringKey("Easy localization"))
                    FeatureRow(iconName: "arrow.2.circlepath", text: LocalizedStringKey("Seamless integration"))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 25)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                
                Spacer()
                
                Button(action: {
                    showIntro = true
                }) {
                    Text(LocalizedStringKey("Learn More"))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 25)
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showIntro) {
            IntroView(isPresented: $showIntro)
        }
    }
}

struct FeatureRow: View {
    let iconName: String
    let text: LocalizedStringKey
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .foregroundColor(.accentColor)
                .font(.system(size: 22))
            Text(text)
                .font(.body)
        }
    }
}

struct Feature: Identifiable {
    var id = UUID()
    var iconName: String
    var title: LocalizedStringKey
    var description: LocalizedStringKey
}

struct IntroView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        let features: [Feature] = [
            Feature(iconName: "rectangle.stack", title: "Airplay Feature", description: "Play your content on devices remotely."),
            Feature(iconName: "rectangle.stack", title: "Channels in Library", description: "Easily access followed shows and more from your channels."),
            Feature(iconName: "play.rectangle", title: "Improved Up Next", description: "Resume episodes and remove any you want to skip."),
            Feature(iconName: "car", title: "CarPlay Updates", description: "Quickly pick up where you left off or find new shows in Browse.")
        ]
        
        NavigationView {
            VStack(spacing: 10) {
                Text(LocalizedStringKey("What's New in Orange Podcasts"))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 25)
                    .padding(.top, 40)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(features) { feature in
                        FeatureView(iconName: feature.iconName, title: feature.title, description: feature.description)
                    }
                }
                
                Spacer()
                
                Image(systemName: "person.2.badge.key")
                    .foregroundColor(.accentColor)
                    .imageScale(.large)
                Text(LocalizedStringKey("The podcasts you purchase in Apple Podcasts Subscriptions are associated with your Apple ID. Your device trust score is used to prevent fraud. Data on your podcast listening and interactions is also used to improve and personalize the service and is not associated with your Apple ID. See how your data is managed..."))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    isPresented = false
                }) {
                    Text(LocalizedStringKey("Continue"))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .background(Color(UIColor.systemBackground))
            .navigationBarHidden(true)
            .padding(30)
        }
    }
}

struct FeatureView: View {
    var iconName: String
    var title: LocalizedStringKey
    var description: LocalizedStringKey
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: iconName)
                .foregroundColor(.accentColor)
                .frame(width: 44, height: 44)
                .imageScale(.large)
                .font(.system(size: 24))
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
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
