//
//  TradingMode.swift
//  trader-dto
//
//  Created by Victor Chernykh on 16.12.2024.
//

public enum TradingMode: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "trading_mode"

	public var id: String { rawValue }

	case trading
	case preMarket
	case postMarket
}
