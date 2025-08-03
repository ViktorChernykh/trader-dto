//
//  WSPathTypes.swift
//	trader-dto
//
//  Created by Victor Chernykh on 05.07.2024.
//

public enum ModuleType: UInt8, Codable, Sendable {
	case admin
	case analize
	case backtest
	case chat
	case finam
	case moex
	case terminal
	case user
	case order
}

public enum ControllerType: UInt8, Codable, Sendable {
	// Admin
	case notification
	case initMoex
	case dividend
	case checkCandles

	// Terminal
	case chart
	case security
	case draw

	// Chat
	case chat

	// Order
	case order
}

public enum FunctionType: UInt8, Codable, Sendable {
	case get
	case list
	case create
	case patch
	case update
	case delete
}
