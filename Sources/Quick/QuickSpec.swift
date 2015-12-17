import XCTest

#if os(Linux)

public class QuickSpec: XCTestCase, XCTestCaseProvider {
	public func spec() {}

	public init() {
		gatherExamples()
	}

	public var allTests : [(String, () -> Void)] {
		let examples = World.sharedWorld.examples(self.dynamicType)
		return examples.map({ example -> (String, () -> Void) in
			return (example.name, { example.run() })
		})
	}

	private func gatherExamples() {
		let world = World.sharedWorld
		world.currentExampleGroup = world.rootExampleGroupForSpecClass(self.dynamicType)
		spec()
		world.currentExampleGroup = nil
	}
}

#endif
