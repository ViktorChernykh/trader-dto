//
//  CandleDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 18/03/2024.
//

import struct Foundation.Date
import class Foundation.DateFormatter
import struct Foundation.Locale
import struct Foundation.TimeZone

/// Response object for item of chart. (Codable - because it is decoded from the database).
public struct CandleDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public let id: Int
	public let opens: Double
	public var close: Double
	public var high: Double
	public var low: Double
	public var value: Double
	public var volume: Int
	public let begin: Date

	// MARK: - Init
	public init(
		id: Int,
		opens: Double,
		close: Double,
		high: Double,
		low: Double,
		value: Double,
		volume: Int,
		begin: Date
	) {
		self.id = id
		self.opens = opens
		self.close = close
		self.high = high
		self.low = low
		self.value = value
		self.volume = volume
		self.begin = begin
	}
}

extension CandleDto: Equatable {
	public static func == (lhs: CandleDto, rhs: CandleDto) -> Bool {
		lhs.id == rhs.id &&
		lhs.close == rhs.close &&
//		lhs.high == rhs.high &&
//		lhs.low == rhs.low &&
//		lhs.begin == rhs.begin &&
		lhs.value == rhs.value &&
		lhs.volume == rhs.volume
	}
}

extension CandleDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(opens)
		hasher.combine(close)
		hasher.combine(high)
		hasher.combine(low)
		hasher.combine(begin)
		hasher.combine(value)
		hasher.combine(volume)
	}
}

extension CandleDto {
	public var csv: String {
		// ; for match to moex format
		return "\(opens);\(close);\(high);\(low);\(value);\(volume);\(begin.datetimeMoex);\(id)"
	}
}

extension CandleDto {
	public init(_ csv: String, id extId: Int = 0) throws {
		let values: [String] = csv.components(separatedBy: ";")
		let id: Int

		if values.count == 8, let _id: Int = .init(values[7]) {
			id = _id
		} else {
			id = extId
		}
		guard values.count >= 7 else {
			throw "CandleDto CSV Decoder: not enough data."
		}
		guard
			let opens: Double = .init(values[0]),
			let close: Double = .init(values[1]),
			let high: Double = .init(values[2]),
			let low: Double = .init(values[3]),
			let value: Double = .init(values[4]),
			let volume: Int = .init(values[5]),
			let begin: Date = values[6].datetimeMoex
		else {
			throw "CandleDto CSV Decoder error CandleDto."
		}

		self.init(
			id: id,
			opens: opens,
			close: close,
			high: high,
			low: low,
			value: value,
			volume: volume,
			begin: begin
		)
	}
}
