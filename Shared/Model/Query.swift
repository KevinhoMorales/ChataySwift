//
//  Query.swift
//  ChataySwift
//
//  Created by Kevinho Morales on 30/4/23.
//

import Foundation

struct Query: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answer: String
    let dateCreated: Date
}
