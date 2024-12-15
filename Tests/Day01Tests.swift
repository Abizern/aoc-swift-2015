import Testing

@testable import AdventOfCode

@Suite("Day01 Tests")
struct Day01Tests {
  @Suite("Tests on sample inputs")
  struct SolutionsTests {
    @Test("Part1 example")
    func testPart1() async throws {
      let day = Day01(data: ")())())")
      let result = try await day.part1()
      #expect(result == -3)
    }

    @Test("Part2 example")
    func testPart2() async throws {
      let day = Day01(data: "()())")
      let result = try await day.part2()
      #expect(result == 5)
    }
  }
}
