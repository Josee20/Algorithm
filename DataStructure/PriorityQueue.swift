//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by 이동기 on 9/6/25.
//

import Foundation

struct PriorityQueue<Element: Comparable> {
    private var heap: Heap<Element>
    
    init(_ elements: [Element] = [], _ sort: @escaping (Element, Element) -> Bool) {
        self.heap = Heap<Element>(elements: elements, sort: sort)
    }
    
    mutating func push(_ element: Element) {
        heap.insert(element)
    }
    
    mutating func pop() -> Element? {
        return heap.remove()
    }
}
