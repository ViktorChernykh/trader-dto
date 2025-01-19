//
//  SecuritiesListRequestDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 23.06.2024.
//

public struct SecuritiesListRequestDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType

	// MARK: - Init
	public init(exchange: ExchangeType) {
		self.exchange = exchange
	}
}

extension SecuritiesListRequestDto {
	public var csv: String {
		exchange.rawValue
	}
}

extension SecuritiesListRequestDto {
	public init(_ csv: String) throws {
		guard let exchange: ExchangeType = .init(rawValue: csv) else {
			throw "SecuritiesListRequestDto csv decoder error."
		}
		self.init(
			exchange: exchange
		)
	}
}
