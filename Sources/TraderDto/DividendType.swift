//
//  DividendType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 02.04.2024.
//

public enum DividendType: Int, Codable, Sendable, CaseIterable, Identifiable {
	public var id: Int { rawValue }

	case quarter = 1
	case halfYear = 2
	case year = 3
	case retainedEarnings = 4
}
