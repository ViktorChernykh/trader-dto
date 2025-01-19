//
//  TradingCalendarLoadDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 18.12.2024.
//

public typealias CalendarExcludeLoadDto = TradingCalendarLoadDto

public struct TradingCalendarLoadDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType
	public let engine: String?
	public let year: Int

	// MARK: - Init
	public init(
		exchange: ExchangeType,
		engine: String?,
		year: Int
	) {
		self.exchange = exchange
		self.engine = engine
		self.year = year
	}
}
