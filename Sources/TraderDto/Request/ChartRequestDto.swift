//
//  ChartRequestDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 18/03/2024.
//

import struct Foundation.Date
import class Foundation.DateFormatter

/// Chart list request.
public struct ChartRequestDto: Codable, Sendable {

	// MARK: Stored properties
	public let exchange: String
	public let board: String
	public let secid: String
	public let intervals: [Int]
	public let asc: Bool
	public let from: Date?
	public let till: Date?
	public let limit: Int?
	public let offset: Int?
	/// Candles number.
	public let start: Int?
	public let end: Int?

	// MARK: - Init
	public init(
		exchange: String,
		board: String,
		secid: String,
		intervals: [Int],
		asc: Bool,
		from: Date? = nil,
		till: Date? = nil,
		limit: Int? = nil,
		offset: Int? = nil,
		start: Int? = nil,
		end: Int? = nil
	) {
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.intervals = intervals
		self.asc = asc
		self.from = from
		self.till = till
		self.limit = limit
		self.offset = offset
		self.start = start
		self.end = end
	}
}

extension ChartRequestDto {
	public var csv: String {
		let fromString: String = if let from { from.timestampSec } else { "" }
		let tillString: String = if let till { till.timestampSec } else { "" }
		let limitString: String = limit != nil ? String(limit!) : ""
		let offsetString: String = offset != nil ? String(offset!) : ""
		let startString: String = start != nil ? String(start!) : ""
		let endString: String = end != nil ? String(end!) : ""
		let intervalsString: String = intervals.map { String($0) }.joined(separator: "|")

		return "\(exchange)\t\(board)\t\(secid)\t\(intervalsString)\t\(asc ? "1" : "")\t\(fromString)\t\(tillString)\t\(limitString)\t\(offsetString)\t\(startString)\t\(endString)"
	}
}

extension ChartRequestDto {
	public init(_ csv: String) throws {
		let items: [String] = csv.components(separatedBy: "\t")

		guard items.count == 11 else {
			throw "ChartRequestDto csv decoder error. Items count != 10"
		}

		self.init(
			exchange: items[0],
			board: items[1],
			secid: items[2],
			intervals: items[3].components(separatedBy: "|").compactMap { Int($0) },
			asc: items[4] == "1",
			from: items[5].datetime,
			till: items[6].datetime,
			limit: Int(items[7]),
			offset: Int(items[8]),
			start: Int(items[9]),
			end: Int(items[10]))
	}
}

extension Array where Element == ChartRequestDto {
	public var csv: String {
		self.map { $0.csv }.joined(separator: "\n")
	}
}

extension Array where Element == ChartRequestDto {

	public init(_ csv: String) throws {
		self = try csv.components(separatedBy: "\n")
			.map { try ChartRequestDto($0) }
	}
}
