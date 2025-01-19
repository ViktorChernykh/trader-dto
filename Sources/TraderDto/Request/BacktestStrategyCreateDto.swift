//
//  BacktestStrategyCreateDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 10.12.2024.
//

public struct BacktestStrategyCreateDto: Codable, Sendable {

	// MARK: Stored properties
	public let name: String
	public let description: String
	public let tip: String
	public let file: String

	// MARK: - Init
	public init(
		name: String,
		description: String,
		tip: String,
		file: String
	) {
		self.name = name
		self.description = description
		self.tip = tip
		self.file = file
	}
}
