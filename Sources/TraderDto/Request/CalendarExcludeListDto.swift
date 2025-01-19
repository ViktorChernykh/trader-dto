//
//  CalendarExcludeListDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 03.01.2025.
//

/// CalendarExclude list request.
public struct CalendarExcludeListDto: Codable, Sendable {

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
