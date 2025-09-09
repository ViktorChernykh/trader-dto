//
//  TradingCalendarDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 18.12.2024.
//

import Foundation

public struct TradingCalendarDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: ExchangeType
	public let engine: String
	public let board: String
	public let from: Date
	public let to: Date
	public let sessionType: TradingSessionType
	public let tradingType: TradingType

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		board: String,
		from: Date,
		to: Date,
		sessionType: TradingSessionType,
		tradingType: TradingType
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.board = board
		self.from = from
		self.to = to
		self.sessionType = sessionType
		self.tradingType = tradingType
	}
}
