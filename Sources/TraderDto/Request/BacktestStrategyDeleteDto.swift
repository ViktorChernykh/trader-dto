//
//  BacktestStrategyDeleteDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.11.2024.
//

import struct Foundation.UUID

public struct BacktestStrategyDeleteDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let strategyId: UUID

	// MARK: - Init
	public init(
		userId: UUID,
		strategyId: UUID
	) {
		self.userId = userId
		self.strategyId = strategyId
	}
}
