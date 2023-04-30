//
//  Chatay_mac0SApp.swift
//  Chatay-mac0S
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

@main
struct Chatay_mac0SApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
                .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
        }
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let contentView = ContentView()
            .environmentObject(Model())
            .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "brain", accessibilityDescription: "Brain")
            button.action = #selector(togglePopover)
        }
        popover = NSPopover()
        popover.contentSize = NSSize(width: 600, height: 600)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
    }
    
    @objc
    private func togglePopover() {
        if let button = statusItem.button {
            if popover.isShown {
                popover.performClose(nil)
                return
            }
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}
