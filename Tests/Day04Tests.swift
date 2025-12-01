import Testing

@testable import AdventOfCode

@Suite("Day04 Tests")
struct Day04Tests {
  @Suite("Tests on sample inputs")
  struct SolutionsTests {
    let day = Day04(data: testInput)

    @Test("Part1 example")
    func testPart1() async throws {
      let result = try await day.part1()
      #expect(result == 609_043)
    }
  }
}

private let testInput = "abcdef"
