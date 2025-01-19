//
//  OrderValidBeforeType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// Time validation for order.
/// Установка временных рамок действия заявки.
public enum OrderValidBeforeType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// Order is valid till the end of the current session.
	case tillEndSession = 1

	/// Order is valid till cancellation.
	case tillCancelled = 2

	/// Order is valid till specified moment. OrderValidBefore.time parameter must be set.
	case exactTime = 3
}
