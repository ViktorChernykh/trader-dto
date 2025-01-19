//
//  TradingCalendarListRequestDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 07.01.2025.
//

public struct TradingCalendarListRequestDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType
	public let engine: String?
	public let board: String?
	public let year: Int
	public let month: Int?
	public let day: Int?

	// MARK: - Init
	public init(
		exchange: ExchangeType,
		engine: String?,
		board: String?,
		year: Int,
		month: Int?,
		day: Int?
	) {
		self.exchange = exchange
		self.engine = engine
		self.board = board
		self.year = year
		self.month = month
		self.day = day
	}
}
