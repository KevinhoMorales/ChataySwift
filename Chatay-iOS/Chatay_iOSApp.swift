//
//  Chatay_iOSApp.swift
//  Chatay-iOS
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

@main
struct Chatay_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
                .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
        }
    }
}
