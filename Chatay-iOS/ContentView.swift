//
//  ContentView.swift
//  Chatay-iOS
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationStack {
            MainView()
                .sheet(isPresented: $isPresented) {
                    NavigationStack {
                        HistoryView()
                            .navigationTitle("History")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresented = true
                        } label: {
                            Text("Show History")
                        }
                        
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
