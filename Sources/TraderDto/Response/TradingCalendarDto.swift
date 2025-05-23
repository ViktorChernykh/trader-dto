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
	public let timeZone: Int
	public let sessionType: TradingSessionType
	public let tradingMode: TradingMode

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		board: String,
		from: Date,
		to: Date,
		timeZone: Int,
		sessionType: TradingSessionType,
		tradingMode: TradingMode
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.board = board
		self.from = from
		self.to = to
		self.timeZone = timeZone
		self.sessionType = sessionType
		self.tradingMode = tradingMode
	}
}
