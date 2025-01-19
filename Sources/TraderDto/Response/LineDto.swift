//
//  LineDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 17.08.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// Object for draw line. (Decoded from the database).
public struct LineDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	public let exchange: String
	public let board: String
	public let secid: String
	public let interval: Int
	public let lineType: LineType
	/// Line width in pixels.
	public var width: Int
	/// Line color in HEX format: FF0000.
	public var color: String
	/// Candle's date begin.
	public var x1Date: Date
	/// Start point Y value.
	public var y1: Double
	/// Correction + / - from the candle.
	public var dx1: Double
	/// The width in candles.
	public var dx: Double
	/// End point Y value.
	public var y2: Double
	/// For group
	public var isShared: Bool
	/// For group
	public var canEdit: Bool
	public var text: String

	// MARK: - Init
	public init(
		id: UUID = .init(),
		exchange: String,
		board: String,
		secid: String,
		interval: Int,
		lineType: LineType,
		width: Int,
		color: String,
		x1Date: Date,
		y1: Double,
		dx1: Double,
		dx: Double,
		y2: Double,
		isShared: Bool,
		canEdit: Bool,
		text: String = ""
	) {
		self.id = id
		self.exchange = exchange
		self.board = board
		self.secid = secid
		self.interval = interval
		self.lineType = lineType
		self.width = width
		self.color = color
		self.x1Date = x1Date
		self.y1 = y1
		self.dx1 = dx1
		self.dx = dx
		self.y2 = y2
		self.isShared = isShared
		self.canEdit = canEdit
		self.text = text
	}
}

extension LineDto {
	public func duplicate(scaleY: Double) -> Self {
		.init(
			exchange: exchange,
			board: board,
			secid: secid,
			interval: interval,
			lineType: lineType,
			width: width,
			color: color,
			x1Date: x1Date,
			y1: y1 + 10 / scaleY,
			dx1: dx1 + 10,
			dx: dx,
			y2: y2 + 10 / scaleY,
			isShared: isShared,
			canEdit: canEdit)
	}

	public func makeUpdateDto() -> LineUpdateDto {
		.init(
			id: id,
			width: width,
			color: color,
			x1Date: x1Date,
			y1: y1,
			dx1: dx1,
			dx: dx,
			y2: y2,
			isShared: isShared,
			canEdit: canEdit,
			text: text
		)
	}
}

extension LineDto {
	public var csv: String {
		"\(id)\t\(exchange)\t\(board)\t\(secid)\t\(interval)\t\(lineType.rawValue)\t\(width)\t\(color)\t\(x1Date.timestamp)\t\(y1)\t\(dx1)\t\(dx)\t\(y2)\t\(isShared ? "1" : "")\t\(canEdit ? "1" : "")\t\(text)"
	}
}

extension LineDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 16,
			let id: UUID = .init(uuidString: values[0]),
			let interval: Int = .init(values[4]),
			let lineType: LineType = .init(rawValue: values[5]),
			let width: Int = .init(values[6]),

			let x1Date: Date = values[8].datetime,
			let y1: Double = .init(values[9]),
			let dx1: Double = .init(values[10]),
			let dx: Double = .init(values[11]),
			let y2: Double = .init(values[12])
		else {
			throw "LineDto csv decoder error."
		}

		self.init(
			id: id,
			exchange: values[1],
			board: values[2],
			secid: values[3],
			interval: interval,
			lineType: lineType,
			width: width,
			color: values[7],
			x1Date: x1Date,
			y1: y1,
			dx1: dx1,
			dx: dx,
			y2: y2,
			isShared: values[13] == "1",
			canEdit: values[14] == "1",
			text: values[15]
		)
	}
}
