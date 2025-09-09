//
//  TradingType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 16.12.2024.
//

public enum TradingType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "trading_type"

	public var id: String { rawValue }

	case trading
	case preMarket
	case postMarket
	case all
}
