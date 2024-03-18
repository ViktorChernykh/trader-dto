//
//  ChartDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

/// Object for build chart.
public struct ChartDto: Codable {
	// MARK: - Stored properties
	public let engine: String
	public let market: String
	public let board: String
	public let security: String
	public let interval: Int
	public let candles: [CandleDto]

	// MARK: - Init
	public init(
		engine: String,
		market: String,
		board: String,
		security: String,
		interval: Int,
		candles: [CandleDto]
	) {
		self.engine = engine
		self.market = market
		self.board = board
		self.security = security
		self.interval = interval
		self.candles = candles
	}
}
