//
//  Tarjan.swift
//  Graph
//
//  Created by Gulya Boiko on 8/12/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct Tarjan {
    private struct TarjanV {
        enum Color {
            case white
            case gray
            case black
        }
        let V: [Int]
        var color: TarjanV.Color = .white
    }
    
    func run(adjacencyMatrix: [[Int]]) -> Stack<Int>? {
        var result = Stack<Int>()
        var tarjanMatrix: [TarjanV] = []
        func dsf(v: Int) {
            tarjanMatrix[v].color = .gray
            for u in tarjanMatrix[v].V {
                if tarjanMatrix[u].color == .white {
                    dsf(v: u)
                }
            }
            tarjanMatrix[v].color = .black
            result.push(v)
        }
        
        for V in adjacencyMatrix {
            tarjanMatrix.append(TarjanV(V: V))
        }
        
        for v in 0..<adjacencyMatrix.count {
            if tarjanMatrix[v].color == .white {
                dsf(v: v)
            }
        }
        return result
    }
}
