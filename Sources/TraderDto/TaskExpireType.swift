//
//  TaskExpireType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 09.11.2024.
//

public enum TaskExpireType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "task_date_type"

	public var id: String { rawValue }

	case tillCancelation
	case tillEndSession
	case tillEndDate
	case tillDate
}
