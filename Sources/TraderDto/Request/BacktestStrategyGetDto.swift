//
//  BacktestStrategyGetDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.11.2024.
//

import struct Foundation.UUID

public struct BacktestStrategyGetDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let strategyId: UUID
	public let isTip: Bool

	// MARK: - Init
	public init(
		userId: UUID,
		strategyId: UUID,
		isTip: Bool
	) {
		self.userId = userId
		self.strategyId = strategyId
		self.isTip = isTip
	}
}
