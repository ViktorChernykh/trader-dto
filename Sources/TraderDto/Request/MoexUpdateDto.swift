//
//  MoexUpdateDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 16.01.2025.
//

public struct MoexUpdateDto: Codable, Sendable {

	// MARK: Stored properties
	public let action: ActionType
	public let exchange: ExchangeType
	public let groups: [UpdateGroupType]
	public let intervals: [Int]?

	// MARK: - Init
	public init(
		action: ActionType,
		exchange: ExchangeType,
		groups: [UpdateGroupType] = [],
		intervals: [Int]? = nil
	) {
		self.action = action
		self.exchange = exchange
		self.groups = groups
		self.intervals = intervals
	}
}
