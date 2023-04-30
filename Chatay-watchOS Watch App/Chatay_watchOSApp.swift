//
//  Chatay_watchOSApp.swift
//  Chatay-watchOS Watch App
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

@main
struct Chatay_watchOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
                .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
        }
    }
}
