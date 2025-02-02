//
//  StatusViewTabs.swift
//  Infini-iOS
//
//  Created by Alex Emry on 8/18/21.
//  
//
    

import Foundation
import SwiftUI

struct StatusTabs: View {
	
	@ObservedObject var bleManager = BLEManager.shared
	@Environment(\.colorScheme) var colorScheme
	@AppStorage("lastStatusViewWasHeart") var lastStatusViewWasHeart: Bool = false
	@ObservedObject var chartManager = ChartManager.shared

	var body: some View{
		VStack {
			HStack {
				Button (action: {
					chartManager.currentChart = .heart
					lastStatusViewWasHeart = true
				}) {
				(Text(Image(systemName: "heart"))
					.foregroundColor(Color.pink) +
				Text(": " + String(format: "%.0f", bleManager.heartBPM))
					.foregroundColor(Color.white) +
				Text(" BPM")
					.foregroundColor(Color.white)
					.font(.body))
					.frame(maxWidth:.infinity, alignment: .center)
					.padding()
					.background(colorScheme == .dark ? (chartManager.currentChart == .heart ? Color.darkGray : Color.darkestGray) : Color.blue)
					.opacity(colorScheme == .dark ? 1.0 : (chartManager.currentChart == .heart ? 1.0 : 0.3))
					.cornerRadius(5)
					.font(.title)
				}.padding(.leading, 10)
				Button (action: {
					chartManager.currentChart = .battery
					lastStatusViewWasHeart = false
				}) {
				(Text(Image(systemName: "battery.100"))
					.foregroundColor(Color.green) +
					Text(": " + String(format: "%.0f", bleManager.batteryLevel) + "%")
					.foregroundColor(Color.white))
					.frame(maxWidth: .infinity, alignment: .center)
					.padding()
					.background(colorScheme == .dark ? (chartManager.currentChart == .battery ? Color.darkGray : Color.darkestGray) : Color.blue)
						.opacity(colorScheme == .dark ? 1.0 : (chartManager.currentChart == .battery ? 1.0 : 0.3))
					.cornerRadius(5)
					.font(.title)
				}
				.padding(.trailing, 10)
			}
		}
	}
}
