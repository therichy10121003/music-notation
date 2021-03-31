//
//	SwiftHelpers.swift
//	music-notation
//
//	Created by Kyle Sherman on 2016-10-15.
//	Copyright © 2016 Kyle Sherman. All rights reserved.
//

extension Collection {
	public var lastIndex: Self.Index {
		guard endIndex != startIndex else { return startIndex }
		return index(endIndex, offsetBy: -1)
	}

	public func isValidIndex(_ index: Self.Index) -> Bool {
		if isEmpty {
			return false
		}
		return index >= startIndex && index < endIndex
	}

	public func isValidIndexRange(_ range: Range<Self.Index>) -> Bool {
		if isEmpty {
			return false
		}
		let upperBound = range ~= range.upperBound ? range.upperBound : index(range.upperBound, offsetBy: -1)
		return range.lowerBound >= startIndex && upperBound < endIndex
	}

	public subscript(safe index: Self.Index) -> Self.Iterator.Element? {
		guard isValidIndex(index) else {
			return nil
		}
		return self[index]
	}
}
