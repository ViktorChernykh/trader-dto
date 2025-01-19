//
//  ChartsDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 14.04.2024.
//

public struct ChartsDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: Int
	public let charts: [ChartDto]

	// MARK: - Init
	public init(
		id: Int,
		charts: [ChartDto]
	) {
		self.id = id
		self.charts = charts
	}
}
