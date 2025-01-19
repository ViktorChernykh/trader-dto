//
//  ActionType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 07.07.2024.
//

/// Type for `InitMoexController()`.
public enum ActionType: String, Codable, Sendable {
	case load
	case update
	case stop
}
