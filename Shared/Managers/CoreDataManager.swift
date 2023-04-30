//
//  CoreDataManager.swift
//  ChataySwift
//
//  Created by Kevinho Morales on 30/4/23.
//

import Foundation
import CoreData

final class CoreDataManger {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManger = {
        CoreDataManger()
    }()
    private init() {
        persistentContainer = NSPersistentContainer(name: "HistoryModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
            
        }
    }
    
}

