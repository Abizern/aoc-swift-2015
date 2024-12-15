import Algorithms
import AoCCommon
import Foundation

struct Day05: AdventDay, Sendable {
  let data: String
  let day = 5
  let puzzleName: String = "--- Day 5: Doesn't He Have Intern-Elves For This? ---"

  init(data: String) {
    self.data = data
  }

  var strings: [String] {
    try! data.lines()
  }

  func part1() async throws -> Int {
    strings.filter(Day05.isNice).count
  }
}

extension Day05 {
  static func isNice(_ str: String) -> Bool {
    let vowels = ["a", "e", "i", "o", "u"].map(Character.init)
    guard Array(str).filter({ vowels.contains($0) }).count >= 3
    else {
      return false
    }

    var pairCount = 0
    let pairs = str.windows(ofCount: 2)

    for pair in pairs {
      if ["ab", "cd", "pq", "xy"].contains(pair) {
        return false
      }
      if pair.first == pair.last {
        pairCount += 1
      }
    }

    if pairCount > 0 {
      return true
    } else {
      return false
    }
  }
}
