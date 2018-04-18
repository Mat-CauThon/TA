//
//  main.swift
//  lab3
//
//  Created by Roman Mishchenko on 01.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

import Foundation



var n : CLongLong = CLongLong(readLine()!)!
var nene = n
n = 1
for _ in 0...nene{
    n *= 10
}
var list : [Int] = []

for _ in 0...(n-1)
{
    list.append(Int(arc4random_uniform(100)))
}
let time1 = CFAbsoluteTimeGetCurrent()
list.append(6)
list.removeFirst()
list.removeLast()
list.removeAll()
let time2 = CFAbsoluteTimeGetCurrent()
var listed : Set<Int> = []


for _ in 0...(n-1)
{
    listed.insert(Int(arc4random_uniform(100)))
}
let time3 = CFAbsoluteTimeGetCurrent()
listed.insert(6)
listed.removeFirst()
listed.dropLast()
listed.removeAll()
let time4 = CFAbsoluteTimeGetCurrent()
print("\(time2-time1)")
print("\(time4-time3)")
