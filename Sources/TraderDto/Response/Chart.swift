//
//  Chart.swift
//  
//
//  Created by Victor Chernykh on 20/03/2024.
//

/// Response object for indicator's or oscillators' chart.
public struct Chart: Codable {
	// MARK: Stored properties
	/// Indicator chart name.
	public let name: String
	/// Indicator chart type.
	public let type: ChartType
	/// Chart values from/near begin to end.
	public let values: [Double]

	// MARK: - Init
	public init(
		name: String,
		type: ChartType,
		values: [Double]
	) {
		self.name = name
		self.type = type
		self.values = values
	}
}
