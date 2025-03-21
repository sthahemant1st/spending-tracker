//
//  DashboardScreen.swift
//  SpendingTracker
//
//  Created by Hemant Shrestha on 21.03.25.
//
import SwiftUI

struct DashboardScreen: View {
    enum TabItem {
        case home
        case settings
    }

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeScreen()
            }

            Tab("Setting", systemImage: "gearshape") {
                SettingsScreen()
            }
        }
    }
}

#Preview {
    DashboardScreen()
}
