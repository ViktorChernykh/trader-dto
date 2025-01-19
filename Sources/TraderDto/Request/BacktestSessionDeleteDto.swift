//
//  BacktestSessionDeleteDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.11.2024.
//

import struct Foundation.UUID

public struct BacktestSessionDeleteDto: Codable, Sendable {

	// MARK: Stored properties
	public let userId: UUID
	public let sessionId: UUID

	// MARK: - Init
	public init(
		userId: UUID,
		sessionId: UUID
	) {
		self.userId = userId
		self.sessionId = sessionId
	}
}
