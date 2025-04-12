//
//  TaskActionType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 12.04.2025.
//

import Foundation

public enum TaskActionType: String, Codable, Sendable, CaseIterable, Identifiable {
	public static let schema: String = "task_action_type"

	public var id: String { rawValue }

	case notify
	case buy
	case sell
}
