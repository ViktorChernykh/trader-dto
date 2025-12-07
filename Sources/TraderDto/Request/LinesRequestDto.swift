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
	public let board: String
	public let secid: String
	public let interval: Int
	public let from: Date
	public let to: Date
	public let sessionId: UUID?

	// MARK: - Init
	public init(
		board: String,
		secid: String,
		interval: Int,
		from: Date,
		to: Date,
		sessionId: UUID?
	) {
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
		return "\(board)\t\(secid)\t\(interval)\t\(from.timestampSec)\t\(to.timestampSec)\t\(sessId)"
	}
}

extension LinesRequestDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard values.count == 6 else {
			throw "LinesRequestDto CSV Decoder: not enough data."
		}
		guard
			let interval: Int = .init(values[2]),
			let from: Date = values[3].datetime,
			let to: Date = values[4].datetime
		else {
			throw "LinesRequestDto CSV Decoder error LinesRequestDto."
		}

		self.init(
			board: values[0],
			secid: values[1],
			interval: interval,
			from: from,
			to: to,
			sessionId: UUID(uuidString: values[5])
		)
	}
}
