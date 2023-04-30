//
//  HistoryView.swift
//  ChataySwift
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "dateCreated", ascending: true)
    ]) private var historyItems: FetchedResults<HistoryItem>
    var body: some View {
        List(historyItems) { historyItem in
            NavigationLink {
                AnswerView(query: getQuery(historyItem: historyItem))
                    .navigationTitle("Answer")
                #if os(macOS)
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            NavigationLink {
                                MainView()
                            } label: {
                                Text("Chatay")
                            }
                        }
                    }
                #endif
            } label: {
                Text(historyItem.question ?? Constants.clearString)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
        }
    }
    
    private func getQuery(historyItem: FetchedResults<HistoryItem>.Element) -> Query {
        let question = historyItem.question ?? Constants.clearString
        let answer = historyItem.answer ?? Constants.clearString
        let dateCreated = historyItem.dateCreated ?? Date()
        let query = Query(question: question, answer: answer, dateCreated: dateCreated)
        return query
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(Model())
            .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
    }
}
