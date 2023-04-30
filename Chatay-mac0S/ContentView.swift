//
//  ContentView.swift
//  Chatay-mac0S
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationSplitView {
            HistoryView()
        } detail: {
            MainView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
