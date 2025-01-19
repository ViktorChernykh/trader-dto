//
//  NotificationDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 25.06.2024.
//

import struct Foundation.Date
import struct Foundation.UUID

public struct NotificationDto: Codable, Sendable, Identifiable {

	// MARK: Stored properties
	public var id: UUID
	public var date: Date
	public var isRead: Bool
	public var text: String
	public var type: NotificationLevelType
	public var direction: WSDirectionType
	public var action: Int

	// MARK: - Init
	public init(
		id: UUID = .init(),
		date: Date = .init(),
		isRead: Bool = false,
		text: String = "",
		type: NotificationLevelType = .low,
		direction: WSDirectionType = .thisDevice,
		action: Int = 0
	) {
		self.id = id
		self.date = date
		self.isRead = isRead
		self.text = text
		self.type = type
		self.direction = direction
		self.action = action
	}
}

extension NotificationDto: Equatable {
	public static func == (lhs: NotificationDto, rhs: NotificationDto) -> Bool {
		lhs.id == rhs.id
	}
}

extension NotificationDto: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

extension NotificationDto {
	public var csv: String {
		"\(id.uuidString)\t\(date.timestamp)\t\(isRead ? "1" : "")\t\(text)\t\(type.rawValue)\t\(direction.rawValue)\t\(action)"
	}
}

extension NotificationDto {
	public init(_ csv: String) throws {
		let values: [String] = csv.components(separatedBy: "\t")

		guard
			values.count == 7,
			let id: UUID = .init(uuidString: values[0]),
			let date: Date = values[1].datetime,
			let type: NotificationLevelType = .init(rawValue: values[4]),
			let direction: WSDirectionType = .init(rawValue: values[5]),
			let action: Int = .init(values[6])
		else {
			throw "NotificationDto CSV Decoder error."
		}

		self.init(
			id: id,
			date: date,
			isRead: values[2] == "1",
			text: values[3],
			type: type,
			direction: direction,
			action: action
		)
	}
}
