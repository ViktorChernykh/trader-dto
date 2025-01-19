//
//  IndicatorPointsDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 20/03/2024.
//

import struct Foundation.Date

public typealias OscillatorPointsDto = IndicatorPointsDto

/// Response object for indicator's item.
public struct IndicatorPointsDto: Codable, Sendable {

	// MARK: Stored properties
	public let values: [Double]
	public let begin: Date

	// MARK: - Init
	public init(
		values: [Double],
		begin: Date
	) {
		self.values = values
		self.begin = begin
	}
}
