import Testing

@testable import AdventOfCode

@Suite("Day05 Tests")
struct Day05Tests {
  @Test("Part 1 nice")
  func part1Nice() {
    #expect(Day05.isNice("ugknbfddgicrmopn") == true)
    #expect(Day05.isNice("aaa") == true)
    #expect(Day05.isNice("jchzalrnumimnmhp") == false)
    #expect(Day05.isNice("haegwjzuvuyypxyu") == false)
    #expect(Day05.isNice("dvszwmarrgswjxmb") == false)
  }
}

private let testInput =
  """
  """
