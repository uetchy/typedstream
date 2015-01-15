import Foundation

NSArchiver.archiveRootObject("abcdefgABCDEFG!?@[]/+*^&-_", toFile: "NSString")
NSArchiver.archiveRootObject("", toFile: "NSStringNil")

NSArchiver.archiveRootObject(1, toFile: "NSNumberWith1digit")
NSArchiver.archiveRootObject(22, toFile: "NSNumberWith2digits")
NSArchiver.archiveRootObject(333, toFile: "NSNumberWith3digits")
NSArchiver.archiveRootObject(4444, toFile: "NSNumberWith4digits")
NSArchiver.archiveRootObject(55555, toFile: "NSNumberWith5digits")

NSArchiver.archiveRootObject([0, 1, 2, 3, 4, 5], toFile: "NSArrayWithNSNumber")
NSArchiver.archiveRootObject(["abc", "def", "012"], toFile: "NSArrayWithNSString")
NSArchiver.archiveRootObject(["abc", 123, 0.5, true], toFile: "NSArrayWithMixedType")
NSArchiver.archiveRootObject(["first", ["second", ["third", 3], 2], 1], toFile: "NSArrayWithNestedArray")
NSArchiver.archiveRootObject([], toFile: "NSArrayEmpty")
NSArchiver.archiveRootObject([true, false], toFile: "NSArrayWithBool")

NSArchiver.archiveRootObject(["key": 123], toFile: "NSDictionary")
