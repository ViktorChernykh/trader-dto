//
//  OrderStatusType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.09.2024.
//

/// Order status. Used in Finam api.
public enum OrderStatusType: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Order is not in OrderBook.
	case none = 1

	/// Order is in OrderBook.
	case active = 2

	/// Order is canceled.
	case cancelled = 3

	/// Order is matched.
	case matched = 4

	public var description: String {
		switch self {
		case .none: "none"
		case .active: "active"
		case .cancelled: "cancelled"
		case .matched: "matched"
		}
	}
}
