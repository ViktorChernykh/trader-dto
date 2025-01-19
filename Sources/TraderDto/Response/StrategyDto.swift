//
//  StrategyDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 13.05.2024.
//

import struct Foundation.UUID

public struct StrategyDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	public let name: String
	public let description: String
	public let tip: String

	// MARK: - Init
	public init(
		id: UUID,
		name: String,
		description: String,
		tip: String
	) {
		self.id = id
		self.name = name
		self.description = description
		self.tip = tip
	}
}

extension StrategyDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

extension StrategyDto: Equatable {
	public static func == (lhs: StrategyDto, rhs: StrategyDto) -> Bool {
		lhs.id == rhs.id &&
		lhs.name == rhs.name &&
		lhs.description == rhs.description &&
		lhs.tip == rhs.tip
	}
}
