//
//  NotificationLevelType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 03.12.2024.
//

public enum NotificationLevelType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "notification_type"
	
	public var id: String { rawValue }

	case low
	case middle
	case hight
}
