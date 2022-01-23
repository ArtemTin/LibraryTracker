import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bookShelf = BookShelf(books: [], creator: UUID(), id: UUID())
        bookShelf.books.append(Book(name: "A Game of Thrones", authors: [Author(fullName: Name(familyName: "Martin", firstName: "George", middleName: "Raymod Richard"), additionalInfo: ["Birth Year": "1948"], id: UUID())], year: 1996, id: UUID(), genres: ["Fantasy"], bookRegData: nil, anotherVersions: [], rating: 7, progress: BookProgress(pagesRead: 0, pagesInBook: 1567), lastOpenedAt: nil, readingPosition: nil))
        // Do any additional setup after loading the view.
        
        bookName.text = bookShelf.books[0].name
        bookAuthor.text = bookShelf.books[0].authors[0].fullName.familyName + " " + bookShelf.books[0].authors[0].fullName.firstName
        bookYear.text = String(bookShelf.books[0].year)
    }
}

