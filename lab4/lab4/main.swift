//
//  main.swift
//  lab4
//
//  Created by Roman Mishchenko on 15.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

import Foundation

var n: Int = 100

struct Slovar {
    var slovar: [Int:[String]]
}
struct Second {
    var slow : [Int : [String]]
    var key : String
}

func hashIng(n: Int) -> Slovar
{
    var ara : Slovar = Slovar.init(slovar: [:])
    
    for i in 0...1
    {
        ara.slovar[i] = ["lol", " stroka number \(i)"]
    }
    return ara
}

func hashIntTwo(n: Int) -> [Second]
{
    var ara : [Second] = []
    var elem : Second = Second.init(slow: [:], key: "")
    for i in 0...(n-1)
    {
        elem.key = "\(i)"
        elem.slow = [i : ["stroka number \(i)" , "lol"]]
        ara.append(elem)
       
    }
    return ara
}

func openHash(array: [String : Slovar]) -> [String : Slovar]
{
    
    var keys = [String](array.keys)
    let text = [Slovar](array.values)
    for i in 0...(n-1) {
        keys[i] = "\(keys[i].hashValue ^ i.hashValue * i)"
    }
    let seq = zip(keys, text)
    let disk = Dictionary(uniqueKeysWithValues:seq)
    return disk
}

func openHashTwo(array: [Second]) -> [Second]
{
    var new = array
    for i in 0...(n-1)
    {
        new[i].key = "\(new[i].key.hashValue ^ i.hashValue * i)"
    }
    return new
}

var newing : [String : Slovar] = [:]

for i in 0...(n-1)
{
    newing["lol \(i)"] = hashIng(n: n)
}

var new : [Second] = hashIntTwo(n: n)




let time1 = CFAbsoluteTimeGetCurrent()
newing = openHash(array: newing)
let time2 = CFAbsoluteTimeGetCurrent()
new = openHashTwo(array: new)
let time3 = CFAbsoluteTimeGetCurrent()
print(time2-time1)
print(time3-time2)
