//
//  IndicatorDto.swift
//
//
//  Created by Victor Chernykh on 20/03/2024.
//

import Foundation

public typealias OscillatorDto = IndicatorDto

/// Response object for indicator's chart.
public struct IndicatorDto: Codable {
	// MARK: Stored properties
	/// Indicator's id from server.
	public let id: UUID
	/// Indicator's name from server.
	public let name: String
	/// Indicator's charts.
	public let charts: [Chart]

	// MARK: - Init
	public init(
		id: UUID,
		name: String,
		charts: [Chart]
	) {
		self.id = id
		self.name = name
		self.charts = charts
	}
}
