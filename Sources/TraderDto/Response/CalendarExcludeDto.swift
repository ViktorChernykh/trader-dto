//
//  CalendarExcludeDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 03.01.2025.
//

import struct Foundation.Date
import struct Foundation.UUID

public struct CalendarExcludeDto: Codable, Sendable, Identifiable {
	// MARK: Stored properties
	public let id: UUID
	public let exchange: ExchangeType
	public let engine: String
	public let date: Date
	public let isWork: Bool
	public let tradeSessionDate: Date?
	public let reason: String

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		date: Date,
		isWork: Bool,
		tradeSessionDate: Date?,
		reason: String
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.date = date
		self.isWork = isWork
		self.tradeSessionDate = tradeSessionDate
		self.reason = reason
	}
}

extension CalendarExcludeDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(exchange)
		hasher.combine(engine)
		hasher.combine(date)
		hasher.combine(isWork)
		hasher.combine(tradeSessionDate)
	}
}
