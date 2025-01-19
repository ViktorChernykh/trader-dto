//
//  OrderValidBeforeType.swift
//	trader-dto
//
//  Created by Victor Chernykh on 12.09.2024.
//

/// Time validation for order.
/// Установка временных рамок действия заявки.
public enum OrderValidBeforeType: Int, CaseIterable, Identifiable, Sendable {

	public var id: Int { self.rawValue }

	/// Order is valid till the end of the current session.
	/// Заявка действует до конца сессии.
	case tillEndSession = 1

	/// Order is valid till cancellation.
	/// Заявка действует, пока не будет отменена.
	case tillCancelled = 2

	/// Order is valid till specified moment. OrderValidBefore.time parameter must be set.
	/// Заявка действует до указанного времени. Параметр OrderValidBefore.time должно быть установлен.
	case exactTime = 3

	public var description: String {
		switch self {
		case .tillEndSession:
			"До конца сессии"
		case .tillCancelled:
			"До отменены"
		case .exactTime:
			"До указанного времени"
		}
	}
}
