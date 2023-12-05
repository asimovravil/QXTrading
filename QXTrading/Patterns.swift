//
//  Patterns.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct Patterns {
    let titlePat: String
    let imageNamePat: String
    let descriptionPat: String
}

let patternList = [
    Patterns(
        titlePat: "Head and Shoulders",
        imageNamePat: "headandshoulders",
        descriptionPat: "The Head and Shoulders pattern in technical analysis is a chart formation predicting a trend reversal from bullish to bearish, resembling a person's head and shoulders. It consists of three peaks: the left shoulder forms during an uptrend as the price rises to a new high and then falls back; the head is created when the price rises to a higher peak than the left shoulder and declines back to the previous level; the right shoulder forms as the price rises again but not as high as the head, before falling back. The neckline, a crucial feature, is drawn by connecting the lowest points of the two troughs between the peaks and can be horizontal or slightly sloped. The pattern is confirmed when the price falls below the neckline after forming the right shoulder, signaling a reversal from the previous uptrend to a new downtrend. The volume typically follows a specific pattern, being higher on the left shoulder than on the head and lower on the right shoulder. Traders calculate a target price by measuring the distance from the top of the head to the neckline and subtracting this from the point where the price breaks the neckline. The inverse Head and Shoulders pattern, which signals a reversal from a downtrend to an uptrend, is the upside-down version of the regular pattern. Traders often use this pattern to decide on entering a short position once the pattern is confirmed, with a stop-loss order placed just above the right shoulder. While popular and reliable, the Head and Shoulders pattern is not foolproof and can lead to false signals, so it should be used alongside other technical analysis tools."
    ),
    Patterns(
        titlePat: "Rectangles",
        imageNamePat: "rectangles",
        descriptionPat: "The Rectangles pattern in technical analysis is a chart formation that indicates a continuation of the current trend. It is formed when the price moves between two parallel horizontal lines, representing the levels of support and resistance, over a period. The pattern starts to form when the price fluctuates within a narrow range, bouncing between the upper resistance and lower support lines. These lines are formed by connecting the high points and low points of the price action respectively, creating a rectangular shape. A key characteristic of the rectangle pattern is the trading volume. The volume typically diminishes as the pattern develops, indicating a consolidation phase where neither buyers nor sellers have clear control. There are two types of rectangle patterns: bullish and bearish. In a bullish rectangle, the pattern forms during an uptrend, suggesting that the upward trend will continue once the price breaks above the resistance line. Conversely, in a bearish rectangle, the pattern forms during a downtrend, indicating that the downward trend will continue once the price breaks below the support line. The breakout from the rectangle is significant and is confirmed by an increase in volume. This breakout is the signal traders use to enter new positions. For a bullish rectangle, traders might enter a long position when the price breaks above resistance, while for a bearish rectangle, a short position might be initiated when the price breaks below support. The target price after the breakout is typically estimated by measuring the height of the rectangle and adding it to the breakout point in a bullish pattern or subtracting it in a bearish pattern. The rectangle pattern is considered a reliable indicator of trend continuation, but it is advisable to use it in conjunction with other technical analysis tools for more accurate predictions. False breakouts can occur, so traders often look for additional confirmation through other indicators or chart patterns."
    ),
    Patterns(
        titlePat: "Channels",
        imageNamePat: "channels",
        descriptionPat: "The Channels pattern in technical analysis is a chart formation that helps predict the direction of an asset's price movement within two parallel lines, representing the support and resistance levels. These lines form a channel guiding the price action. Channels are classified into three types: Ascending, Descending, and Horizontal. An Ascending Channel, formed during an uptrend, has both support and resistance lines sloping upwards, indicating bullish sentiment. A Descending Channel, identified during a downtrend, features downward-sloping lines, signaling bearish sentiment. The Horizontal Channel, or ranging market, occurs when the price fluctuates within horizontal support and resistance levels, suggesting a lack of significant price movement in either direction. Trading strategies within channels typically involve buying near the support line and selling near the resistance line. Breakouts, where the price breaks through the support or resistance line, are critical in channel patterns. An upward breakout from an ascending or horizontal channel suggests a continuation or strengthening of the uptrend, while a downward breakout from a descending or horizontal channel indicates a continuation or intensification of the downtrend. Volume is crucial in confirming the strength and validity of channel patterns and breakouts. An increase in volume during a breakout is often seen as a confirmation of the pattern’s strength. Traders may project the target price after a breakout by measuring the height of the channel at its widest part and applying that measurement from the breakout point."
    ),
]
