//
//  MainView.swift
//  Chatay-iOS
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    @State private var chatText = Constants.clearString
    @EnvironmentObject private var model: Model
    @State private var isSearching = false
    private var isFormValid: Bool {
        !chatText.isEmptyOrWhiteSpace
    }
    var body: some View {
        VStack {
            List(model.queries, id: \.self) { query in
                VStack(alignment: .leading) {
                    Text(query.question)
                        .bold()
                    Text(query.answer)
                }
            }
            Spacer()
            HStack {
                TextField("Search...", text: $chatText)
                    #if os(iOS)
                    .textFieldStyle(.roundedBorder)
                    #endif
                Button {
                    isSearching = true
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }
                #if os(iOS)
                .buttonStyle(.borderless)
                #endif
                .tint(.blue)
                .disabled(!isFormValid)
                
            }
        }.padding()
            .overlay {
                if isSearching {
                    ProgressView("LOADING ANSWER")
                }
            }
            .navigationTitle("Chatay")
    }
    
    private func performSearch() {
        Constants.API.OPEN_AI_API.sendCompletion(with: chatText, maxTokens: 500) { result in
            isSearching = false
            switch result {
            case .success(let success):
                print("success -> \(success)")
                let answer = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? Constants.clearString
                let query = Query(question: chatText, answer: answer, dateCreated: Date())
                DispatchQueue.main.async {
                    model.queries.append(query)
                }
                do {
                    try model.saveQuery(query: query)
                } catch let error {
                    print("error -> \(error.localizedDescription)")
                }
                chatText = Constants.clearString
            case .failure(let failure):
                print("failure -> \(failure)")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
            .environment(\.managedObjectContext, CoreDataManger.shared.persistentContainer.viewContext)
    }
}
