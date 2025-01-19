//
//  OrderDirection.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.08.2024.
//

/// Transaction direction. Used in Finam api.
public enum OrderDirection: Int, Codable, Sendable, CaseIterable, Identifiable {

	public var id: Int { rawValue }

	/// Buy direction.
	case buy = 2

	/// Sell direction.
	case sell = 1
}
