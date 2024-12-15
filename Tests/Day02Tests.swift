import Testing

@testable import AdventOfCode

@Suite("Day02 Tests")
struct Day02Tests {
  @Suite("Parser Tests")
  struct ParserTests {
    @Test("Test parser implementation")
    func parseInput() {
      let day = Day02(data: testInput)
      #expect(day.dimensions.count == 2)
    }
  }

  @Suite("Tests on sample inputs")
  struct SolutionsTests {
    let day = Day02(data: testInput)

    @Test("Part1 example")
    func testPart1() async throws {
      let result = try await day.part1()
      #expect(result == 58 + 43)
    }

    @Test("Part2 example")
    func testPart2() async throws {
      let result = try await day.part2()
      #expect(result == 34 + 14)
    }
  }
}

private let testInput =
  """
  2x3x4
  1x1x10
  """
