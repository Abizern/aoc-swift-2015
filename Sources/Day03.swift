import Algorithms
import AoCCommon
import CoreGraphics
import Foundation

struct Day03: AdventDay, Sendable {
  let offsets: [Cell.Offset]
  let day = 3
  let puzzleName: String = "--- Day 3: Perfectly Spherical Houses in a Vacuum ---"

  init(data: String) {
    offsets = data.map { char in
      switch char {
      case "^": .up
      case "v": .down
      case "<": .left
      case ">": .right
      default: fatalError("Unexpected character: \(char)")
      }
    }
  }

  func part1() async throws -> Int {
    var visited = Set<Cell>()
    var position = Cell.origin
    visited.insert(Cell.origin)

    for offset in offsets {
      position = position.offset(by: offset)
      visited.insert(position)
    }

    return visited.count
  }

  func part2() async throws -> Int {
    var visited = Set<Cell>()
    var p1 = Cell.origin
    var p2 = Cell.origin
    visited.insert(Cell.origin)

    for chunk in offsets.chunks(ofCount: 2) {
      p1 = p1.offset(by: chunk.first!)
      p2 = p2.offset(by: chunk.last!)

      visited.insert(p1)
      visited.insert(p2)
    }
    return visited.count
  }
}
