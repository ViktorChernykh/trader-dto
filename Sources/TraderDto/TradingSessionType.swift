//
//  TradingSessionType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 18.12.2024.
//

public enum TradingSessionType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "trading_session_type"

	public var id: String { rawValue }

	case morning
	case main
	case evening
}
