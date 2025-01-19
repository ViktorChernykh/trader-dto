//
//  OrderPropertyType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// The behaviour of the application when placed in OrderBook. Used in Finam api.
/// Поведение заявки при выставлении в стакан.
public enum OrderPropertyType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// The residual of partially matched order is to stay in OrderBook.
	case putInQueue = 1

	/// The residual of partially matched order is to be cancelled.
	case cancelBalance = 2

	/// Filling the order only in case the posibility of immediate and full execution.
	case immOrCancel = 3
}
