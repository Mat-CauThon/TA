//
//  main.swift
//  lab13.2SWIFT
//
//  Created by Roman Mishchenko on 12.04.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

// last checked with Xcode 9.0b4
import Foundation

func depthFirstSearch(_ graph: Graph, source: Node) -> [String]
{
    var nodesExplored = [source.label]
    source.visited = true
    
    for edge in source.neighbors
    {
        if !edge.neighbor.visited
        {
            nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
        }
    }
    return nodesExplored
}

let graph = Graph()


let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")

let nodeH = graph.addNode("h")
let nodeI = graph.addNode("i")
let nodeJ = graph.addNode("j")
let nodeK = graph.addNode("k")
let nodeL = graph.addNode("l")
let nodeM = graph.addNode("m")
let nodeN = graph.addNode("n")
let nodeO = graph.addNode("o")
let nodeP = graph.addNode("p")
let nodeR = graph.addNode("r")
let nodeS = graph.addNode("s")
let nodeT = graph.addNode("t")


graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeD, neighbor: nodeH)
graph.addEdge(nodeD, neighbor: nodeI)
graph.addEdge(nodeE, neighbor: nodeJ)
graph.addEdge(nodeE, neighbor: nodeK)
graph.addEdge(nodeF, neighbor: nodeL)
graph.addEdge(nodeF, neighbor: nodeM)
graph.addEdge(nodeG, neighbor: nodeN)
graph.addEdge(nodeG, neighbor: nodeO)
graph.addEdge(nodeH, neighbor: nodeP)
graph.addEdge(nodeH, neighbor: nodeR)
graph.addEdge(nodeI, neighbor: nodeS)
graph.addEdge(nodeI, neighbor: nodeT)

var time1 = CFAbsoluteTimeGetCurrent()
let nodesExplored = depthFirstSearch(graph, source: nodeA)
time1 = CFAbsoluteTimeGetCurrent() - time1
print(time1)
print(nodesExplored)
