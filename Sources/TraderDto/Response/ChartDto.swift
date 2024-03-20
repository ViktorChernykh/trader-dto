//
//  ChartDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

import Foundation

/// Response object for build chart.
public struct ChartDto: Codable {
	// MARK: Stored properties
	/// ChartView's id  from client.
	public let chartId: UUID
	public let candles: [CandleDto]
	/// Chart date end.
	public let end: Date
	/// Chart interval.
	public let interval: Int
	public let securityId: String
	public let engineId: UUID
	public let marketId: UUID
	public let boardId: UUID
	public let indicators: [IndicatorDto]
	public let oscillators: [OscillatorDto]

	// MARK: - Init
	public init(
		chartId: UUID = UUID(),
		candles: [CandleDto],
		end: Date,
		interval: Int,
		securityId: String,
		engineId: UUID,
		marketId: UUID,
		boardId: UUID,
		indicators: [IndicatorDto],
		oscillators: [OscillatorDto]
	) {
		self.chartId = chartId
		self.candles = candles
		self.end = end
		self.interval = interval
		self.securityId = securityId
		self.engineId = engineId
		self.marketId = marketId
		self.boardId = boardId
		self.indicators = indicators
		self.oscillators = oscillators
	}
}
