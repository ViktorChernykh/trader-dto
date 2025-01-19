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

	// MARK: - Init
	public init(
		id: UUID,
		exchange: ExchangeType,
		engine: String,
		date: Date,
		isWork: Bool
	) {
		self.id = id
		self.exchange = exchange
		self.engine = engine
		self.date = date
		self.isWork = isWork
	}
}

extension CalendarExcludeDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(exchange)
		hasher.combine(engine)
		hasher.combine(date)
		hasher.combine(isWork)
	}
}
