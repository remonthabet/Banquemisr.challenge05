//
//  Banquemisr_challenge05App.swift
//  Banquemisr.challenge05
//
//  Created by remon on 05/09/2024.
//

import SwiftUI

@main
struct Banquemisr_challenge05App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
