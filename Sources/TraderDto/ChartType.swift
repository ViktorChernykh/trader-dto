//
//  ChartType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 20/03/2024.
//

/// Chart type.
public enum ChartType: String, Codable, Sendable, CaseIterable, Identifiable {
	public var id: String { rawValue }

	case candle
	case bar
	case line
}
