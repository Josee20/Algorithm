//
//  Book.swift
//  VIsualBookManager0
//
//  Created by 이동기 on 2022/05/28.
//

import Foundation

struct Book {
    var name: String?
    var genre: String?
    var author: String?
    
    func bookPrint() {
        print("Name: \(name!)")
        print("Genre: \(genre!)")
        print("Author: \(author!)")
        print("--------------------")
    }
}
