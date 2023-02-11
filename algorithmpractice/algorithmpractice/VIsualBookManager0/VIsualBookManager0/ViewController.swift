//
//  ViewController.swift
//  VIsualBookManager0
//
//  Created by 이동기 on 2022/05/28.
//

import UIKit

class ViewController: UIViewController {

    var myBookManager = BookManager()
    
    @IBOutlet weak var bookTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBOutlet weak var countBooksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "귀멸의 칼날", genre: "만화", author: "몰라유")
        let book3 = Book(name: "꼼꼼한 재은씨", genre: "서적", author: "이재은")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        countBooksLabel.text! = String(myBookManager.countBooks())
    }
    
    @IBAction func showAllAction(_ sender: Any) {
        bookTextView.text! = myBookManager.showAllBooks()
    }
    
    @IBAction func registerBookAction(_ sender: Any) {
        var newBook = Book()
        
        newBook.name = nameTextField.text!
        newBook.genre = genreTextField.text!
        newBook.author = authorTextField.text!
        
        myBookManager.registerBook(bookObject: newBook)
        bookTextView.text! = "\(newBook.name!) has registered"
        countBooksLabel.text! = String(myBookManager.countBooks())
    }
    
    @IBAction func searchBooksAction(_ sender: Any) {
        let searchingBook = myBookManager.searchBooks(name: nameTextField.text!)
        
        if searchingBook != nil {
            bookTextView.text! = searchingBook!
        } else {
            bookTextView.text! = "찾으시는 책이 없습니다."
        }
    }
    
    @IBAction func removeBooksAction(_ sender: Any) {
        myBookManager.removeBook(name: nameTextField.text!)
        bookTextView.text! = "\(nameTextField.text!)가 삭제되었습니다"
        countBooksLabel.text! = String(myBookManager.countBooks())
    }

}

