//
//  BackTestDto.swift
//
//
//  Created by Victor Chernykh on 11/03/2024.
//

import Foundation

public struct BackTestDto: Codable {
	// MARK: - Stored properties
	public let startMoney: Double
	public let strategy: String
	public let dateStart: Date?
	public let dateEnd: Date?

	// MARK: - Init
	public init(
		startMoney: Double,
		strategy: String,
		dateStart: Date? = nil,
		dateEnd: Date? = nil
	) {
		self.startMoney = startMoney
		self.strategy = strategy
		self.dateStart = dateStart
		self.dateEnd = dateEnd
	}
}
