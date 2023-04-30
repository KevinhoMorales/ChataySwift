//
//  Chatay_tv0SApp.swift
//  Chatay-tv0S
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

@main
struct Chatay_tv0SApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
                .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
        }
    }
}
