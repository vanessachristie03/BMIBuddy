//
//  BMIBuddyApp.swift
//  BMIBuddy
//
//  Created by Vanessa on 24/04/24.
//

import SwiftUI
import SwiftData

@main
struct BMIBuddyApp: App {
    var body: some Scene {
        WindowGroup {
            StartPage()
        }
        .modelContainer(for: BMIdata.self)
    }
}
