//
//  OrderConditionType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// Conditional order types. Used in Finam api.
public enum OrderConditionType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// Best Bid.
	/// Лучшая цена покупки.
	case bid = 1

	/// Best Bid or Last trade price and higher.
	/// Лучшая цена покупки или сделка по заданной цене и выше.
	case bidOrLast = 2

	/// Best Ask.
	/// Лучшая цена продажи.
	case ask = 3

	/// Best Ask or Last trade price and lower.
	/// Лучшая цена продажи или сделка по заданной цене и ниже.
	case askOrLast = 4

	/// Placement time. Parameter OrderCondition.time must be set.
	/// Время выставления заявки на Биржу. Параметр OrderCondition.time должен быть установлен.
	case time = 5

	/// Coverage below specified.
	/// Обеспеченность ниже заданной.
	case covDown = 6

	/// Coverage above specified.
	/// Обеспеченность выше заданной.
	case covUp = 7

	/// Last trade price and higher.
	/// Сделка на рынке по заданной цене или выше.
	case lastUp = 8

	/// Last trade price and lower.
	/// Сделка на рынке по заданной цене или ниже.
	case lastDown = 9

	public var description: String {
		switch self {
		case .bid:
			"Лучшая цена покупки"
		case .bidOrLast:
			"Лучшая цена покупки или сделка по заданной цене и выше"
		case .ask:
			"Лучшая цена продажи"
		case .askOrLast:
			"Лучшая цена продажи или сделка по заданной цене и ниже"
		case .time:
			"time"
		case .covDown:
			"Обеспеченность ниже заданной"
		case .covUp:
			"Обеспеченность выше заданной"
		case .lastUp:
			"Сделка на рынке по заданной цене или выше"
		case .lastDown:
			"Сделка на рынке по заданной цене или ниже"
		}
	}
}
