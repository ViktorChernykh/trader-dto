//
//  UpdateGroupType.swift
//  trader-dto
//
//  Created by Victor Chernykh on 17.07.2024.
//

public enum UpdateGroupType: Codable, Sendable {
	case engines
	case markets
	case boards
	case securities
	case candles
	case news
}
