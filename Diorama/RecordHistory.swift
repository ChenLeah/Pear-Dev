//
//  RecordHistory.swift
//  Diorama
//
//  Created by 陳詠恩 on 2024/6/9.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation


struct History: Identifiable, Codable {
    let id: UUID
    var position: String?
    var transcript: String?
    
    init(id: UUID = UUID(), position: String? = nil, transcript: String? = nil) {
        self.id = id
        self.position = position
        self.transcript = transcript
    }
    
}
