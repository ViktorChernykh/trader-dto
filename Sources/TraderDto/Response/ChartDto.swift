//
//  ChartDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 18/03/2024.
//

import struct Foundation.Calendar

extension ChartDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(exchange)
		hasher.combine(board)
		hasher.combine(secid)
		hasher.combine(interval)
		hasher.combine(candles)
	}
}

extension ChartDto: Equatable {
	public static func == (lhs: ChartDto, rhs: ChartDto) -> Bool {
		lhs.exchange == rhs.exchange &&
		lhs.board == rhs.board &&
		lhs.secid == rhs.secid &&
		lhs.candles.count == rhs.candles.count &&
		lhs.candles.first == rhs.candles.first
	}
}

extension ChartDto: Comparable {
	public static func < (lhs: ChartDto, rhs: ChartDto) -> Bool {
		lhs.id < rhs.id &&
		lhs.exchange < rhs.exchange &&
		lhs.board < rhs.board &&
		lhs.secid < rhs.secid &&
		lhs.candles.count < rhs.candles.count
	}
}

/// Response object for draw chart.
public struct ChartDto: Codable, Identifiable, Sendable {

	// MARK: Stored properties
	public var id: String {
		"\(exchange)\(board)\(secid)\(interval)"
	}
	public let exchange: String
	public let board: String
	public let secid: String
	public var interval: Int
	public var candles: [CandleDto]

	// MARK: - Init
	public init(
		exchange: String,
		board: String,
		secid: String,
		interval: Int,
		candles: [CandleDto]
	) {
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.interval = interval
		self.candles = candles
	}
	
	public var intervalName: String {
		switch interval {
		case 1:
			"M1"
		case 5:
			"M5"
		case 10:
			"M10"
		case 60:
			"H1"
		case 24:
			"D1"
		case 7:
			"W1"
		case 31:
			"m1"
		case 4:
			"Q1"
		default:
			"?"
		}
	}

	public var intervalType: Calendar.Component {
		switch interval {
		case 1, 10:
			.minute
		case 60:
			.hour
		case 24:
			.day
		case 7:
			.weekOfMonth
		case 31:
			.month
		case 4:
			.quarter
		default:
			.day
		}
	}

	public var candleInterval: Double {
		switch interval {
		case 1:
			60
		case 10:
			600
		case 60:
			3600
		case 24:
			86400
		case 30:
			2592000
		case 7:
			604800
		case 4:
			7948800
		default:
			0
		}
	}
}

extension ChartDto {
	public var csv: String {
		let candles: String = candles.map { $0.csv }.joined(separator: "|")
		return "\(exchange)\t\(board)\t\(secid)\t\(interval)\t\(candles)"
	}
}

extension ChartDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")
		guard values.count == 5 else {
			throw "ChartDto CSV Decoder error. values.count != 5"
		}
		let candleRows: [String] = values[4].components(separatedBy: "|")

		guard let interval: Int = .init(values[3]) else {
			throw "ChartDto CSV Decoder error."
		}

		self.init(
			exchange: values[0],
			board: values[1],
			secid: values[2],
			interval: interval,
			candles: try candleRows.compactMap { try CandleDto($0) }
		)
	}
}
