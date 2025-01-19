//
//  OrderConditionType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// Conditional order types. Used in Finam api.
public enum OrderConditionType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// Best bid.
	case bid = 1

	/// Best bid or last trade price and higher.
	case bidOrLast = 2

	/// Best ask.
	case ask = 3

	/// Best ask or last trade price and lower.
	case askOrLast = 4

	/// Placement on exchange time. Parameter OrderCondition.time must be set.
	case time = 5

	/// Coverage below specified.
	case covDown = 6

	/// Coverage above specified.
	case covUp = 7

	/// Last trade price and higher.
	case lastUp = 8

	/// Last trade price and lower.
	case lastDown = 9
}
