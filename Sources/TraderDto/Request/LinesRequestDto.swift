//
//  LinesRequestDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 22.08.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// Object for request array of lines.
public struct LinesRequestDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: String
	public let board: String
	public let secid: String
	public let interval: Int
	public let from: Date
	public let to: Date

	// MARK: - Init
	public init(
		exchange: String,
		board: String,
		secid: String,
		interval: Int,
		from: Date,
		to: Date
	) {
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.interval = interval
		self.from = from
		self.to = to
	}
}

extension LinesRequestDto {
	public var csv: String {
		"\(exchange)\t\(board)\t\(secid)\t\(interval)\t\(from.timestampSec)\t\(to.timestampSec)"
	}
}

extension LinesRequestDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard values.count == 6 else {
			throw "LinesRequestDto CSV Decoder: not enough data."
		}
		guard
			let interval: Int = .init(values[3]),
			let from: Date = values[4].datetime,
			let to: Date = values[5].datetime
		else {
			throw "LinesRequestDto CSV Decoder error LinesRequestDto."
		}

		self.init(
			exchange: values[0],
			board: values[1],
			secid: values[2],
			interval: interval,
			from: from,
			to: to
		)
	}
}
