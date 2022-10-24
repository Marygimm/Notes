//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Mary Moreira on 24/10/2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
