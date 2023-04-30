//
//  String+Extensions.swift
//  Chatay-iOS
//
//  Created by Kevinho Morales on 30/4/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
