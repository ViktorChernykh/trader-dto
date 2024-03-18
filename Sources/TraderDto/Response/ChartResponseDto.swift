//
//  ChartDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

import Foundation

/// Object for build chart.
public struct ChartDto: Codable {
	// MARK: - Stored properties
	public let chartId: UUID
	public let candles: [CandleDto]

	// MARK: - Init
	public init(
		chartId: UUID,
		candles: [CandleDto]
	) {
		self.chartId = chartId
		self.candles = candles
	}
}
