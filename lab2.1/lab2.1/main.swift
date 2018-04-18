//
//  main.swift
//  lab2.1
//
//  Created by Roman Mishchenko on 22.02.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

import Foundation

print("Number of vertex")

var n: Int = Int(readLine()!)!
var s = 0
var sum = 0
var point: Bool = true

var array = Array(repeating:Array(repeating:Int(), count: n), count: n)

var way = Array(repeating:Int(), count: n)
var visit = Array(repeating:Bool(), count: n)

var index: Int = 0

for i in 0...(n-1)
{
    way[i] = 10000
    visit[i] = false
    for j in 0...(n-1)
    {
        array[i][j] = Int(arc4random_uniform(100)) - 10
        if(array[i][j] < 0 && (i != j) )
        {
            point = false
        }
        
    }
}

way[s] = 0
let time1 = CFAbsoluteTimeGetCurrent()
for _ in 0...(n-2)
{
    var min = 10000
    for i in 0...(n-1)
    {
        if(!visit[i] && way[i] < min)
        {
          min = way[i]
            index = i
        }
    }
    visit[index] = true
    for i in 0...(n-1)
    {
        if(!visit[i] && array[index][i] > 0 && way[index] != 10000 && way[index] + array[index][i] < way[i])
        {
            way[i] = way[index] + array[index][i]
        }
    }
}
let time2 = CFAbsoluteTimeGetCurrent()
print("Time for algoritm: \(time2-time1)")

