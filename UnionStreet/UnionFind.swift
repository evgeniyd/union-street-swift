//
//  UnionFind.swift
//  UnionStreet
//
//  Created by Yevhen Dubinin on 2/26/24.
//

import Foundation

struct UnionFind {
    private var par: [Int]
    private var rank: [Int]

    init(_ count: Int) {
        par = Array(0..<count)
        rank = Array(repeating:1, count: count)
    }

    func find(_ n: Int) -> Int {
        var n = par[n]
        while n != par[n] {
            n = par[n]
        }
        return n
    }

    @discardableResult
    mutating func union(_ n1: Int, _ n2: Int) -> Bool {
        let p1 = find(n1)
        let p2 = find(n2)

        if p1 != p2 {
            if rank[p1] >= rank[p2] {
                par[p2] = p1
                rank[p1] += 1
            } else {
                par[p1] = p2
                rank[p2] += 1
            }

            return true
        }

        return false
    }
}
