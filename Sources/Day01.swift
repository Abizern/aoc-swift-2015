import Algorithms
import Foundation

struct Day01: AdventDay, Sendable {
  let moves: [Int]
  let day = 1
  let puzzleName: String = "--- Day 1: Not Quite Lisp ---"

  init(data: String) {
    // Given well formed input just transform the characters into the change of floor.
    moves = data.map { $0 == "(" ? 1 : -1 }
  }

  func part1() async throws -> Int {
    // Just return the sum
    moves.reduce(0, +)
  }

  func part2() async throws -> Int {
    // Take the partial sums of successive moves lazily until the result is -1
    // Return the number of partial sums which is the number of changes.
    // Since the first partial sum is 0, this accounts for the 0-indexed array.
    moves
      .lazy
      .reductions(into: 0, +=)
      .prefix(while: { $0 != -1 })
      .count
  }
}
