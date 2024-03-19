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
	public let chartId: UUID
	public let end: Date
	public let interval: Int
	public let candles: [CandleDto]

	// MARK: - Init
	public init(
		chartId: UUID = UUID(),
		end: Date,
		interval: Int,
		candles: [CandleDto]
	) {
		self.chartId = chartId
		self.end = end
		self.interval = interval
		self.candles = candles
	}
}
