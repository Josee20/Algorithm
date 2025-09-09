//
//  Heap.swift
//  Algorithm
//
//  Created by 이동기 on 9/6/25.
//


// 참고 링크: https://the-brain-of-sic2.tistory.com/63
import Foundation

struct Heap<Element: Comparable> {
    
    var elements: [Element] = []
    private let sort: (Element, Element) -> Bool
    
    init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.sort = sort
        buildHeap()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    mutating func insert(_ value: Element) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    @discardableResult
    mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let value = elements.removeLast()
        if !elements.isEmpty { siftDown(from: 0) }
        return value
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else { return nil }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            siftDown(from: index)
            siftUp(from: index)
        }
        return elements.removeLast()
    }
    
    private mutating func buildHeap() {
        guard count > 1 else { return }
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(from: i)
        }
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if parent == candidate { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
}
