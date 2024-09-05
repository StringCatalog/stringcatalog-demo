//
//  SettingsView.swift
//  StringCatalogDemo
//
//  Created by Bill Richards on 9/5/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    SettingsRow(icon: "person.circle.fill", title: "Profile", color: .blue)
                    SettingsRow(icon: "envelope.fill", title: "Email", color: .green)
                    SettingsRow(icon: "lock.fill", title: "Password", color: .red)
                }
                
                Section(header: Text("Preferences")) {
                    SettingsRow(icon: "bell.fill", title: "Notifications", color: .purple)
                    SettingsRow(icon: "moon.fill", title: "Dark Mode", color: .indigo)
                    SettingsRow(icon: "hand.raised.fill", title: "Privacy", color: .orange)
                }
                
                Section(header: Text("Support")) {
                    SettingsRow(icon: "questionmark.circle.fill", title: "Help", color: .teal)
                    SettingsRow(icon: "exclamationmark.bubble.fill", title: "Report a Problem", color: .pink)
                    SettingsRow(icon: "star.fill", title: "Rate App", color: .yellow)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: LocalizedStringKey
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .semibold))
        }
        .padding(.vertical, 4)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

#Preview {
    SettingsView()
}
