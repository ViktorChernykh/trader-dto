//
//  CandleDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

import Foundation

/// Response object for item of chart.
public struct CandleDto: Codable {
	// MARK: Stored properties
	public let opens: Double
	public let close: Double
	public let high: Double
	public let low: Double
	public let begin: Date

	// MARK: - Init
	public init(
		opens: Double,
		close: Double,
		high: Double,
		low: Double,
		begin: Date
	) {
		self.opens = opens
		self.close = close
		self.high = high
		self.low = low
		self.begin = begin
	}
}
