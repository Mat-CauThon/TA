//
//  main.swift
//  lab2.2
//
//  Created by Roman Mishchenko on 22.02.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//


import Foundation
print("Number of vertex")

let n: Int = Int(readLine()!)!
let N = 10000

var dino = Array(repeating:Array(repeating:Int(), count: N), count: N)
var s = Array(repeating:Array(repeating:Int(), count: N), count: N)

for i in 1...n
{
    
    for j in 1...n
    {
        s[i][j] = 0r;
        if (i != j && dino[i][j] != 0)
        {
            dino[i][j] = Int(arc4random_uniform(10))
        }
    }
}
dino[1][1] = 0;


let time1 = CFAbsoluteTimeGetCurrent()
let cl = clock()
for k in 1...n
{
    for i in 1...n
    {
        for j in 1...n
        {
            if(dino[i][i] + dino[j][j] < dino[i][j])
            {
                dino[i][j] = dino[i][i] + dino[i][j]
                s[i][j] = j;
            }
        }
    }
}
let cl2 = clock()
let time2 = CFAbsoluteTimeGetCurrent()

print("Time for algoritm: \(Double(cl2 - cl)/Double(CLOCKS_PER_SEC))")
print("Time for algoritm: \(time2-time1)")
