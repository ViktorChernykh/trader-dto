//
//  CandleDto.swift
//
//
//  Created by Victor Chernykh on 18/03/2024.
//

import Foundation

public struct CandleDto: Codable {
	// MARK: - Stored properties
	public let opens: Double
	public let close: Double
	public let high: Double
	public let low: Double
	public let value: Double
	public let volume: Int
	public let begin: Date
	public let end: Date

	// MARK: - Init
	public init(
		opens: Double,
		close: Double,
		high: Double,
		low: Double,
		value: Double,
		volume: Int,
		begin: Date,
		end: Date
	) {
		self.opens = opens
		self.close = close
		self.high = high
		self.low = low
		self.value = value
		self.volume = volume
		self.begin = begin
		self.end = end
	}
}
