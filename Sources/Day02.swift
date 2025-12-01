import Foundation
import Parsing

struct Day02: AdventDay, Sendable {
  let dimensions: [(Int, Int, Int)]
  let day = 2
  let puzzleName: String = "--- Day 2: I Was Told There Would Be No Math ---"

  init(data: String) {
    self.dimensions = Self.dimensionParser(data)
  }

  func part1() async throws -> Int {
    dimensions.map(paper).reduce(0, +)
  }

  func part2() async throws -> Int {
    dimensions.map(ribbon).reduce(0, +)
  }
}

extension Day02 {
  func paper(_ dimensions: (Int, Int, Int)) -> Int {
    let (a, b, c) = dimensions
    return [3 * a * b, 2 * b * c, 2 * a * c].reduce(0, +)
  }

  func ribbon(_ dimensions: (Int, Int, Int)) -> Int {
    let (a, b, c) = dimensions
    return [2 * (a + b) + [a, b, c].reduce(1, *)].reduce(0, +)
  }
}

extension Day02 {
  static func dimensionParser(_ str: String) -> [(Int, Int, Int)] {
    let regex = /(?<a>\d+)x(?<b>\d+)x(?<c>\d+)/

    return str
      .split(separator: "\n")
      .map { line in
        guard
          let match = line.wholeMatch(of: regex ),
          let a = Int(match.a),
          let b = Int(match.b),
          let c = Int(match.c)
        else {
          fatalError("\(str) is not in the expected format")
        }
        let s = [a, b, c].sorted()
        return (s[0], s[1], s[2])
      }
  }
}
