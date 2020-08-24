//
//  Stack.swift
//  Graph
//
//  Created by Gulya Boiko on 8/12/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct Stack<T> {
    private (set) var top: Node<T>?
    
    // push
    mutating func push(_ value: T) {
        let currentTop = top
        top = Node(value: value)
        top?.next = currentTop
    }

    @discardableResult
    mutating func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
}

