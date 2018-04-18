//
//  main.swift
//  lab1(TA)
//
//  Created by Roman Mishchenko on 08.02.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

import Foundation

let text2: String
let m = Int(readLine()!)!
let n = Int(readLine()!)!

var max: Int = 0
var maxIndexI: Int = 0
var maxIndexJ: Int = 0

var array = Array(repeating:Array(repeating:Int(), count: m), count: n)
let timeNano1 = CFAbsoluteTimeGetCurrent()
for i in 0...(n-1)
{
    for j in 0...(m-1)
    {
        array[i][j] = Int(arc4random_uniform(100))
        
        if(array[i][j] > max)
        {
            max = array[i][j]
            maxIndexI = i
            maxIndexJ = j
        }
    }
    //print(array[i])
}
let timeNano2 = CFAbsoluteTimeGetCurrent()
print("Сколько прошло времени: \(timeNano2 - timeNano1)")
print("max: \(max)")
print("J: \(maxIndexJ)")
print("I: \(maxIndexI)")
