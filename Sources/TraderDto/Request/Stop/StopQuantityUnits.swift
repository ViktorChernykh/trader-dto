//
//  StopQuantityUnits.swift
//  trader-dto
//
//  Created by Victor Chernykh on 26.09.2024.
//

public enum StopQuantityUnits: Int, Sendable, Identifiable {

	public var id: Int { self.rawValue }

	/// Value in percent.
	case percent = 1

	/// Value in lots.
	case lots = 2
}
