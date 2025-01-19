//
//  TradingSessionListDto.swift
//  trader-dto
//
//  Created by Victor Chernykh on 17.12.2024.
//

public struct TradingSessionListDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType
	public let engine: String?
	public let board: String?

	// MARK: - Init
	public init(
		exchange: ExchangeType,
		engine: String?,
		board: String? = nil
	) {
		self.exchange = exchange
		self.engine = engine
		self.board = board
	}
}
