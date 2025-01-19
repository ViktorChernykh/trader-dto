//
//  OrderBookDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 22.07.2024.
//

import struct Foundation.UUID

public struct OrderBookDto: Codable, Sendable {

	// MARK: Stored properties
	public let secid: String
	public let board: String
	/// Number of decimal places.
	public var scale: Int
	public var timestamp: Int
	public var rows: [OrderBookRow]

	// MARK: - Init
	public init(
		secid: String,
		board: String,
		scale: Int = 0,
		timestamp: Int = 0,
		rows: [OrderBookRow] = []
	) {
		self.secid = secid
		self.board = board
		self.scale = scale
		self.timestamp = timestamp
		self.rows = rows
	}
}

public struct OrderBookRow: Codable, Sendable, Identifiable {
	// MARK: Stored properties
	public let id: UUID
	public let price: Double
	/// Quantity of lots.
	public let quantity: Int

	// MARK: - Init
	public init(
		id: UUID = .init(),
		price: Double,
		quantity: Int
	) {
		self.id = id
		self.price = price
		self.quantity = quantity
	}
}
