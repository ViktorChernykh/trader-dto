//
//  LineUpdateDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 17.08.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// Object for draw line.
public struct LineUpdateDto: Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	/// Line width.
	public var width: Int
	/// Line color.
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
	public let isShared: Bool
	/// For group
	public let canEdit: Bool
	public let text: String

	// MARK: - Init
	public init(
		id: UUID = .init(),
		width: Int,
		color: String,
		x1Date: Date,
		y1: Double,
		dx1: Double,
		dx: Double,
		y2: Double,
		isShared: Bool,
		canEdit: Bool,
		text: String
	) {
		self.id = id
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

extension LineUpdateDto {
	public var csv: String {
		"\(id)\t\(width)\t\(color)\t\(x1Date.timestampSec)\t\(y1)\t\(dx1)\t\(dx)\t\(y2)\t\(isShared ? "1" : "")\t\(canEdit ? "1" : "")\t\(text)"
	}
}

extension LineUpdateDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 11,
			let id: UUID = .init(uuidString: values[0]),
			let width: Int = .init(values[1]),
			let x1Date: Date = values[3].datetime,
			let y1: Double = .init(values[4]),
			let dx1: Double = .init(values[5]),
			let dx: Double = .init(values[6]),
			let y2: Double = .init(values[7])
		else {
			throw "LineUpdateDto csv decoder error."
		}

		self.init(
			id: id,
			width: width,
			color: values[2],
			x1Date: x1Date,
			y1: y1,
			dx1: dx1,
			dx: dx,
			y2: y2,
			isShared: values[8] == "1",
			canEdit: values[9] == "1",
			text: values[10]
		)
	}
}
