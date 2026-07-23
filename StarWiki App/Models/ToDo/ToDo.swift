//
//  ToDo.swift
//  StarWiki App
//
//  Created by Student on 4/24/26.
//

import Foundation
import SwiftUI

struct ToDo: Identifiable, Codable {
    var id: UUID = UUID()
    var task: String
    var isCompleted: Bool = false
}
