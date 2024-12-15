import CoreGraphics
import Foundation

struct Day03: AdventDay, Sendable {
  let data: String
  let day = 3
  let puzzleName: String = "--- Day 3: Perfectly Spherical Houses in a Vacuum ---"

  init(data: String) {
    self.data = data
  }

  var instructions: [Character] {
    Array(data)
  }

  func part1() async throws -> Int {
    var visited = Set<CGPoint>()
    var position = CGPoint(x: 0, y: 0)
    var instructions = instructions
    visited.insert(position)

    while !instructions.isEmpty {
      let char = instructions.removeFirst()
      position = position.move(char)
      visited.insert(position)
    }

    return visited.count
  }

  func part2() async throws -> Int {
    var visited = Set<CGPoint>()
    var p1 = CGPoint(x: 0, y: 0)
    var p2 = CGPoint(x: 0, y: 0)
    var instructions = instructions
    visited.insert(p1)
    visited.insert(p2)

    guard instructions.count % 2 == 0 else {
      fatalError("There must be an even number of instructions")
    }

    while !instructions.isEmpty {
      let i1 = instructions.removeFirst()
      let i2 = instructions.removeFirst()

      p1 = p1.move(i1)
      p2 = p2.move(i2)

      visited.insert(p1)
      visited.insert(p2)
    }

    return visited.count
  }
}

extension CGPoint {
  func move(_ char: Character) -> CGPoint {
    switch char {
    case "^":
      CGPoint(x: x, y: y + 1)
    case "v":
      CGPoint(x: x, y: y - 1)
    case "<":
      CGPoint(x: x - 1, y: y)
    case">":
      CGPoint(x: x + 1, y: y)
    default:
      self
    }
  }
}
