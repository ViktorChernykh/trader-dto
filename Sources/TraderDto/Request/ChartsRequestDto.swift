//
//  ChartsRequestDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

import Foundation

public struct ChartsRequestDto: Codable {
	// MARK: - Stored properties
	public let charts: [ChartRequestDto]

	// MARK: - Init
	public init(charts: [ChartRequestDto]) {
		self.charts = charts
	}
}

public struct ChartRequestDto: Codable {
	// MARK: - Stored properties
	public let engine: String
	public let market: String
	public let board: String
	public let security: String
	public let interval: Int
	public let from: Date?
	public let till: Date
	public let limit: Int?

	// MARK: - Init
	public init(
		engine: String,
		market: String,
		board: String,
		security: String,
		interval: Int,
		from: Date?,
		till: Date,
		limit: Int?
	) {
		self.engine = engine
		self.market = market
		self.board = board
		self.security = security
		self.interval = interval
		self.from = from
		self.till = till
		self.limit = limit
	}
}
