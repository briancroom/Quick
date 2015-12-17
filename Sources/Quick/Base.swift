#if os(Linux)
/// Base class to stand in for NSObject on Linux
public class Base {
	init() {}
	var description: String { return "" }
}

#else

import Foundation

public typealias Base = NSObject

#endif
