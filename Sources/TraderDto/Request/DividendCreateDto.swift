//
//  DividendCreateDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 30.03.2024.
//

import struct Foundation.Date

public struct DividendCreateDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: ExchangeType
	public let secid: String
	public let lastDateBuy: Date
	public let dateClosed: Date
	public let period: Int	// DividendType

	// MARK: - Init
	public init(
		exchange: ExchangeType,
		secid: String,
		lastDateBuy: Date,
		dateClosed: Date,
		period: Int			// DividendType
	) {
		self.exchange = exchange
		self.secid = secid
		self.lastDateBuy = lastDateBuy
		self.dateClosed = dateClosed
		self.period = period
	}
}

extension DividendCreateDto {
	public var csv: String {
		"\(exchange)\t\(secid)\t\(lastDateBuy.date ?? "")\t\(dateClosed.date ?? "")\t\(period)"
	}
}

extension DividendCreateDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 5,
			let exchangeType: ExchangeType = .init(rawValue: values[0]),
			let lastDateBuy: Date = values[2].dateMoex,
			let dateClosed: Date = values[3].dateMoex,
			let period: Int = .init(values[4])
		else {
			throw "DividendCreateDto csv decoder error."
		}

		self.init(
			exchange: exchangeType,
			secid: values[1],
			lastDateBuy: lastDateBuy,
			dateClosed: dateClosed,
			period: period
		)
	}
}
