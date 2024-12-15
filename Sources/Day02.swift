import Foundation
import Parsing

struct Day02: AdventDay, Sendable {
  let data: String
  let day = 2
  let puzzleName: String = "--- Day 2: I Was Told There Would Be No Math ---"

  init(data: String) {
    self.data = data
  }

  var dimensions: [(Int, Int, Int)] {
    try! DimensionsParser().parse(data).map(ordered)
  }

  func part1() async throws -> Int {
    dimensions.map(paper).reduce(0, +)
  }

  func part2() async throws -> Int {
    dimensions.map(ribbon).reduce(0, +)
  }
}

extension Day02 {
  struct DimensionsParser: Parser {
    var body: some Parser<Substring, [(Int, Int, Int)]> {
      Many {
        Int.parser()
        "x"
        Int.parser()
        "x"
        Int.parser()
      } separator: {
        "\n"
      } terminator: {
        End()
      }
    }
  }

  func ordered(_ dimensions: (Int, Int, Int)) -> (Int, Int, Int) {
    let (a, b, c) = dimensions
    let dims = [a, b, c].sorted()
    return (dims[0], dims[1], dims[2])
  }

  func paper(_ dimensions: (Int, Int, Int)) -> Int {
    let (a, b, c) = dimensions
    return [3 * a * b, 2 * b * c, 2 * a * c].reduce(0, +)
  }

  func ribbon(_ dimensions: (Int, Int, Int)) -> Int {
    let (a, b, c) = dimensions
    return [2 * (a + b) + [a, b, c].reduce(1, *)].reduce(0, +)
  }
}
