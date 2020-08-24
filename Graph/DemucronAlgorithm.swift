//
//  DemucronAlgorithm.swift
//  Graph
//
//  Created by Gulya Boiko on 8/10/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct DemucronAlgorithm {
    func run(adjacencyVector: [[Int]]) throws -> [[Int]] {
        let matrix = convertToAdjacencyMatrix(adjacencyVector)
        func calculateСolumn(_ number: Int) -> Int {
            var result = 0
            for i in 0..<matrix.count {
                result += matrix[i][number]
            }
            return result
        }
        var m = [Int?]()
        func recalculateM(_ indexsV: [Int]) {
            // вычесть из каждого значения значение из строчки indexV
            for indexV in indexsV {
                m[indexV] = nil
                for i in 0..<m.count {
                    if let value = m[i], value != 0  { // не nil
                        m[i] = value - matrix[indexV][i]
                    } else if !indexsV.contains(indexV) {
                        m[i] = nil
                    }
                }
            }
        }
        var result: [[Int]] = []
        var level = 0
        var v = Set<Int>()
        // Заполним массив полустепенями входа
        for i in 0..<matrix.count {
            m.append(calculateСolumn(i))
            v.insert(i)
        }
        while v.count > 0 {
            var zero = [Int]()
            for i in v { // формируем список вершин с нулевой полустепенью захода
                if m[i] == 0 {
                    zero.append(i)
                }
            }
            if zero.count == 0 { // если на очередном этапе нет вершин с нулевой степенью захода значит граф нельзя топологически сортировать
                throw NSError(domain: "", code: 100, userInfo: nil)
            }
            result.append([])
            for i in zero { // добавляем вершины со степенью захода 0 в результирующий массив
                result[level].append(i)
                v.remove(i)
            }
            recalculateM(zero)
            level += 1
        }
        return result
    }
    
    private func convertToAdjacencyMatrix(_ adjacencyVector: [[Int]]) -> [[Int]] {
        let vCount = adjacencyVector.count
        var result: [[Int]] = []
        for v in adjacencyVector {
            var array = Array(repeating: 0, count: vCount)
            for i in v {
                array[i] = 1
            }
            result.append(array)
        }
        return result
    }
}
