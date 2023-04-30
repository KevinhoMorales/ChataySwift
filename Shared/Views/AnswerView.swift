//
//  AnswerView.swift
//  ChataySwift
//
//  Created by Kevinho Morales on 30/4/23.
//

import SwiftUI

struct AnswerView: View {
    var query: Query
    var body: some View {
        VStack() {
            Text(query.question)
                .font(.title)
                .bold()
                .padding(.bottom)
            Text(query.answer)
                .font(.headline)
            Spacer()
            Text("\(query.dateCreated)")
                .font(.caption)
        }.padding()
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(query: Query(question: "When was Swift released?", answer: "Swift 1.0 was introduced in 2014, Apple's WWDC. The language underwent an upgrade to version 1.2 during 2014.", dateCreated: Date()))
    }
}
