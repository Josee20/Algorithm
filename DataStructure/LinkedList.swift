//
//  LinkedList.swift
//  Algorithm
//
//  Created by 이동기 on 4/21/25.
//

import Foundation

private class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init() { }
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(data: data)
        tail = node?.next
    }
    
    func pop() -> T? {
        return tail?.data
    }
}



