//
//  StrategyType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 29.03.2024.
//

public enum StrategyType: String, Codable, Identifiable, CaseIterable, Sendable {
	case smaRsiMacd

	// MARK: - Computed properties
	public var id: String {
		name
	}

	public var name: String {
		switch self {
		case .smaRsiMacd:
			return "SMA_RSI_MACD"
		}
	}

	public var description: String {
		switch self {
		case .smaRsiMacd:
			"Покупает когда sma[i] > price, rsi[i] < rsiMin, macd[i] > signalLine[i]\n" +
			"Продает когда  sma[i] < price, rsi[i] > rsiMax, macd[i] < signalLine[i]"
		}
	}
}
