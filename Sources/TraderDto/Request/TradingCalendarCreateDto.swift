//
//  TradingCalendarCreateDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 20.12.2024.
//

import Foundation

public struct TradingCalendarCreateDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType
	public let engine: String
	public let board: String
	public let from: Date
	public let to: Date
	public let sessionType: TradingSessionType
	public let tradingType: TradingType

	// MARK: - Init
	public init(
		exchange: ExchangeType,
		engine: String,
		board: String,
		from: Date,
		to: Date,
		sessionType: TradingSessionType,
		tradingType: TradingType
	) {
		self.exchange = exchange
		self.engine = engine
		self.board = board
		self.from = from
		self.to = to
		self.sessionType = sessionType
		self.tradingType = tradingType
	}
}
