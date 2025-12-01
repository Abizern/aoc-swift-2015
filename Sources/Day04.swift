import CryptoKit
import Foundation

struct Day04: AdventDay, Sendable {
  let data: String
  let day = 4
  let puzzleName: String = "--- Day 4: The Ideal Stocking Stuffer ---"

  init(data: String) {
    self.data = data
  }

  func part1() async throws -> Int {
    generator(data) { hash in
      hash.hasPrefix("MD5 digest: 00000")
    }
  }

  func part2() async throws -> Int {
    generator(data) { hash in
      hash.hasPrefix("MD5 digest: 000000")
    }
  }
}

extension Day04 {
  func generator(_ seed: String, condition: (String) -> Bool) -> Int {
    var input = 0

    for n in 1 ... 100_000_000 {
      input = n
      let str = seed + String(n)
      let data = Data(str.utf8)
      let hash = Insecure.MD5.hash(data: data).description
      if condition(hash) {
        break
      }
    }
    return input
  }
}
