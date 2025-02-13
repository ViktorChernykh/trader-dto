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
	public let sessionId: UUID?

	// MARK: - Init
	public init(
		exchange: String,
		board: String,
		secid: String,
		interval: Int,
		from: Date,
		to: Date,
		sessionId: UUID?
	) {
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.interval = interval
		self.from = from
		self.to = to
		self.sessionId = sessionId
	}
}

extension LinesRequestDto {
	public var csv: String {
		let sessId: String = sessionId == nil ? "" : sessionId!.uuidString
		return "\(exchange)\t\(board)\t\(secid)\t\(interval)\t\(from.timestampSec)\t\(to.timestampSec)\t\(sessId)"
	}
}

extension LinesRequestDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard values.count == 7 else {
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
			to: to,
			sessionId: UUID(uuidString: values[6])
		)
	}
}
