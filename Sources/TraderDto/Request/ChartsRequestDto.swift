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
	public let chartId: UUID
	public let engineId: UUID
	public let marketId: UUID
	public let boardId: UUID
	public let security: String
	public let interval: Int
	public let from: Date?
	public let till: Date
	public let limit: Int?

	// MARK: - Init
	public init(
		chartId: UUID,
		engineId: UUID,
		marketId: UUID,
		boardId: UUID,
		security: String,
		interval: Int,
		from: Date?,
		till: Date,
		limit: Int?
	) {
		self.chartId = chartId
		self.engineId = engineId
		self.marketId = marketId
		self.boardId = boardId
		self.security = security
		self.interval = interval
		self.from = from
		self.till = till
		self.limit = limit
	}
}
