//
//  BacktestStrategyListDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.11.2024.
//

import struct Foundation.UUID

public struct BacktestStrategyListDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let page: Int?
	public let per: Int?

	// MARK: - Init
	public init(
		userId: UUID,
		page: Int? = nil,
		per: Int? = nil
	) {
		self.userId = userId
		self.page = page
		self.per = per
	}
}
