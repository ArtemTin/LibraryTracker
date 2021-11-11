//
//  Model.swift
//  LibraryTracker
//
//  Created by Артём Тихоненко on 11.11.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct Author {
    let name: String
    let fullName: String
    let id: UUID
}

typealias Year = Int

enum BookReadProgressString: String, CaseIterable {
    case unopened = "unopened"
    case started = "started"
    case inProgress = "inProgress"
    case almostRead = "almostRead"
    case read = "read"
}

struct BookReadProgress {
    var pagesRead: Int
    let pagesInBook: Int
    var percentageRead: Int {
        100 * pagesRead / pagesInBook
    }
    var progressStringEnum: BookReadProgressString {
        if percentageRead == 0 {
            return .unopened
        } else if percentageRead < 10 {
            return .started
        } else if percentageRead < 80 {
            return .inProgress
        } else if percentageRead < 99 {
            return .almostRead
        } else if percentageRead == 100 {
            return .read
        }
        return .unopened
    }
    
    var progressString: String {
        return progressStringEnum.rawValue
    }
}

struct Book {
    let name: String
    let author: Author
    let year: Year
    
    var progress: BookReadProgress
    var lastOpenedAt: Date
    
}
