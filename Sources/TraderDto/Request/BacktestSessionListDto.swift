//
//  BacktestSessionListDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.11.2024.
//

import struct Foundation.UUID

public struct BacktestSessionListDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let strategyId: UUID
	public let page: Int?
	public let per: Int?

	// MARK: - Init
	public init(
		userId: UUID,
		strategyId: UUID,
		page: Int? = nil,
		per: Int? = nil
	) {
		self.userId = userId
		self.strategyId = strategyId
		self.page = page
		self.per = per
	}
}
