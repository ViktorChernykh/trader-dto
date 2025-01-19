//
//  BacktestDealListDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 09.06.2024.
//

import struct Foundation.UUID

public struct BacktestDealListDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let sessionId: UUID
	public let page: Int?
	public let per: Int?

	// MARK: - Init
	public init(
		userId: UUID,
		sessionId: UUID,
		page: Int?,
		per: Int?
	) {
		self.userId = userId
		self.sessionId = sessionId
		self.page = page
		self.per = per
	}
}
