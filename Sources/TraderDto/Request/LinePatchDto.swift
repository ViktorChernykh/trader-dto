//
//  LinePatchDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 17.08.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

/// Object for draw line.
public struct LinePatchDto: Sendable, Identifiable {

	// MARK: Stored properties
	public let id: UUID
	/// Line width.
	public var width: Int?
	/// Line color.
	public var color: String?
	/// Candle's date begin.
	public var x1Date: Date?
	/// Start point Y value.
	public var y1: Double?
	/// Correction + / - from the candle.
	public var dx1: Double?
	/// The width in candles.
	public var dx: Double?
	/// End point Y value.
	public var y2: Double?
	/// For group
	public let isShared: Bool?
	/// For group
	public let canEdit: Bool?
	public let text: String?

	// MARK: - Init
	public init(
		id: UUID = .init(),
		width: Int? = nil,
		color: String? = nil,
		x1Date: Date? = nil,
		y1: Double? = nil,
		dx1: Double? = nil,
		dx: Double? = nil,
		y2: Double? = nil,
		isShared: Bool? = nil,
		canEdit: Bool? = nil,
		text: String? = nil
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

extension LinePatchDto {
	public var csv: String {
		var result: [String: String] = .init()
		result["0"] = id.uuidString
		if let width {
			result["1"] = "\(width)"
		}
		if let color {
			result["2"] = color
		}
		if let x1Interval: String = x1Date?.timestamp {
			result["3"] = x1Interval
		}
		if let y1 {
			result["4"] = "\(y1)"
		}
		if let dx1 {
			result["5"] = "\(dx1)"
		}
		if let dx {
			result["6"] = "\(dx)"
		}
		if let y2 {
			result["7"] = "\(y2)"
		}
		if let isShared {
			result["8"] = isShared ? "1" : ""
		}
		if let canEdit {
			result["9"] = canEdit ? "1" : ""
		}
		if let text {
			result["10"] = text
		}
		let array: [String] = result.map { key, value in
			"\(key)|\(value)"
		}
		return array.joined(separator: "\n")
	}
}

extension LinePatchDto {
	public init(_ csv: String) throws {
		let components: [String] = csv.components(separatedBy: "\n")

		var id: UUID? = nil
		var width: Int? = nil
		var color: String? = nil
		var x1Date: Date? = nil
		var y1: Double? = nil
		var dx1: Double? = nil
		var dx: Double? = nil
		var y2: Double? = nil
		var isShared: Bool? = nil
		var canEdit: Bool? = nil
		var text: String? = nil

		for component in components {
			let items = component.split(separator: "|", maxSplits: 1, omittingEmptySubsequences: false)
			guard items.count == 2 else {
				throw "LinePatchDto csv decoder error."
			}
			switch items[0] {
			case "0":
				id = UUID(uuidString: String(items[1]))
			case "1":
				width = Int(items[1])
			case "2":
				color = String(items[1])
			case "3":
				x1Date = String(items[1]).datetime
			case "4":
				y1 = Double(items[1])
			case "5":
				dx1 = Double(items[1])
			case "6":
				dx = Double(items[1])
			case "7":
				y2 = Double(items[1])
			case "8":
				isShared = items[1] == "1"
			case "9":
				canEdit = items[1] == "1"
			case "10":
				text = String(items[1])
			default:
				throw "LinePatchDto csv decoder error."
			}
		}
		guard let id else {
			throw "LinePatchDto csv decoder error."
		}

		self.init(
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
