import Foundation

struct Day01: AdventDay, Sendable {
  let data: String
  let day = 1
  let puzzleName: String = "--- Day 0: Placeholder! ---"

  init(data: String) {
    self.data = data
  }

  func part1() async throws -> Int {
    var floor = 0
    for char in data {
      switch char {
      case "(":
        floor += 1
      case ")":
        floor -= 1
      default:
        break
      }
    }
    return floor
  }

  func part2() async throws -> Int {
    var floor = 0
    var position = 0

    while floor != -1 {
      let idx = data.index(data.startIndex, offsetBy: position)
      switch data[idx] {
      case "(":
        floor += 1
      case ")":
        floor -= 1
      default:
        break
      }
      position += 1
    }
    return position
  }
}
