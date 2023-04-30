//
//  Model.swift
//  ChataySwift
//
//  Created by Kevinho Morales on 30/4/23.
//

import Foundation

final class Model: ObservableObject {
    @Published var queries = [Query]()
    func saveQuery(query: Query) throws {
        let viewContext = CoreDataManger.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.question = query.question
        historyItem.answer = query.answer
        historyItem.dateCreated = Date()
        try viewContext.save()
    }
}
