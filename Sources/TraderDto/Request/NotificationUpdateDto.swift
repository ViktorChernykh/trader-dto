//
//  NotificationUpdateDto.swift
//	trader-dto
//
//  Created by Victor Chernykh on 25.06.2024.
//

import struct Foundation.UUID

public typealias NotificationDeleteDto = NotificationUpdateDto

/// Update mean to set the `isRead` to `true`.
public struct NotificationUpdateDto: Codable, Sendable {

	// MARK: Stored properties
	public let ids: [UUID]

	// MARK: - Init
	public init(ids: [UUID]) {
		self.ids = ids
	}
}

public struct NotificationGetDto: Codable {

	// MARK: Stored properties
	public let read: Bool?

	// MARK: - Init
	public init(read: Bool?) {
		self.read = read
	}
}

public struct NotificationCreateDto: Codable, Sendable {

	// MARK: Stored properties
	public let text: String
	public let type: NotificationLevelType
	public let direction: WSDirectionType
	public let action: Int

	// MARK: - Init
	public init(
		text: String,
		type: NotificationLevelType,
		direction: WSDirectionType,
		action: Int
	) {
		self.text = text
		self.type = type
		self.direction = direction
		self.action = action
	}
}
