import Foundation

struct Name {
    let familyName: String
    let firstName: String
    let middleName: String?
}

struct Author {
    let fullName: Name
    var additionalInfo: [String: String] = [:]
    let id: UUID
}

typealias Year = Int
typealias Rating = Int
typealias Genre = String
typealias BookID = UUID
typealias UserID = UUID

enum BookReadProgress: String {
    case unopened
    case started
    case inProgress
    case almostRead
    case read
}

struct BookProgress {
    var pagesRead: Int
    let pagesInBook: Int
    var percentageRead: Int {
        100 * pagesRead / pagesInBook
    }
    var progress: BookReadProgress {
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
    
}

struct BookRegistrationInfo {
    let isbn10: String?
    let isbn13: String?
    let udc: String?
}

struct Book {
    let name: String
    let authors: [Author]
    let year: Year
    let id: UUID
    let genres: [Genre]
    let bookRegData: BookRegistrationInfo?
    var anotherVersions: [BookID]
    
    var rating: Rating
    
    var progress: BookProgress
    var lastOpenedAt: Date?
    var readingPosition: Int?
    
}


struct BookShelf {
    var books: [Book]
    let creator: UserID
    let id: UUID
}
