//
//  Indicator.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct Indicator {
    let titleInd: String
    let imageNameInd: String
    let descriptionInd: String
}

let indicatorList = [
    Indicator(
        titleInd: "Bolinger Bands",
        imageNameInd: "graphics",
        descriptionInd: "The Bollinger Bands indicator is a popular tool in technical analysis used to analyze price volatility and identify potential price reversal points. Developed by John Bollinger in the early 1980s, it consists of three bands – an upper band, a middle band, and a lower band. Here's how the Bollinger Bands work: Middle Band (SMA): The middle band is a simple moving average (SMA) of the price over a specified period. The most common period is 20 days, but traders can adjust this based on their preferences. Upper Band (Volatility): The upper band is typically set at two standard deviations above the middle band. Standard deviation is a measure of volatility. As prices become more volatile, the bands widen, and as volatility decreases, the bands contract. Lower Band (Volatility): The lower band is set at two standard deviations below the middle band. Like the upper band, it adjusts to changes in volatility. How to Interpret: Price Within Bands: When the price is moving between the upper and lower bands, it suggests that the market is in a range-bound or sideways phase. This could be an indication of a potential breakout. Price Touching Upper Band: If the price touches or exceeds the upper band, it may indicate that the market is overbought. Traders might consider this a potential sell signal. Price Touching Lower Band: Conversely, if the price touches or falls below the lower band, it may suggest that the market is oversold. Traders might see this as a potential buy signal. Bands Contraction and Expansion: Periods of low volatility are marked by the contraction of the bands, while periods of high volatility result in the expansion of the bands. Sudden price movements often follow periods of low volatility. Bollinger Band Squeeze: A Bollinger Band squeeze occurs when the volatility contracts to a historically low level. Traders often anticipate a significant price movement after a squeeze. It's important to note that while Bollinger Bands are a useful tool, they are not foolproof. Traders often use them in conjunction with other technical indicators and analysis methods to make well-informed decisions. Additionally, like any technical indicator, they work better in certain market conditions than in others. As with any trading strategy, risk management is crucial."
    ),
    Indicator(
        titleInd: "Moving Average",
        imageNameInd: "movingAverage",
        descriptionInd: "The Moving Average (MA) is a fundamental statistical technique used extensively in time series analysis, primarily in financial markets, to smooth out short-term fluctuations and bring into focus longer-term trends or cycles. It involves creating a series of averages of different subsets of the entire data set. There are several types of Moving Averages, each with its unique characteristics and applications. The Simple Moving Average (SMA) is the most straightforward form, calculated by taking the arithmetic mean of a given set of values over a specific number of periods. Typically, it uses closing prices of stocks or commodities and is used to smooth out price data over time. The Exponential Moving Average (EMA), on the other hand, places greater emphasis on more recent data, making it more responsive to new information. This is particularly useful for traders who need to make quick decisions based on the latest market trends. The Weighted Moving Average (WMA) assigns a linearly increasing weight to more recent data, and the Smoothed Moving Average (SMMA) is a variation of the EMA that applies more smoothing. In financial analysis, Moving Averages are pivotal for identifying trends in markets. An upward-moving average can signal an uptrend in a stock, whereas a downward-moving average might indicate a downtrend. Another popular application is in observing crossovers between short-term and long-term moving averages, which can signal potential shifts in market trends. Furthermore, MAs can serve as support and resistance levels in trading strategies. From a mathematical standpoint, the calculation of an SMA involves summing up the closing prices over a set number of periods and then dividing this total by the number of periods. The EMA, however, incorporates a more complex formula that significantly weights recent prices."
    ),
    Indicator(
        titleInd: "Stochastic",
        imageNameInd: "stochastic",
        descriptionInd: "At its core, the Stochastic Oscillator comprises two lines: the %K line and the %D line. The %K line is the primary line and indicates the relation of the closing price to the price range over a specific period. The %D line is essentially a moving average of the %K line, typically calculated over three periods, and it functions as a signal line to identify turning points. The calculation of the Stochastic Oscillator involves two main formulas. The %K value is calculated as the ratio of the difference between the current close and the lowest low to the difference between the highest high and the lowest low, multiplied by 100. This formula places the current closing price within the context of the price range over a specified period. The %D value, a simple moving average of %K, smooths the result to provide a clearer signal. A key feature of the Stochastic Oscillator is its ability to identify overbought and oversold conditions in the market. Typically, readings above 80 indicate that the asset is overbought, while readings below 20 suggest it is oversold. These levels signal traders about potential reversals in the market, with overbought conditions possibly leading to a downturn and oversold conditions indicating a potential upturn. The Stochastic Oscillator is particularly useful for its crossovers. A bullish signal is generated when the %K line crosses above the %D line, especially below the 20 level, indicating an oversold market turning upward. Conversely, a bearish signal occurs when the %K line crosses below the %D line above the 80 level, signaling a potentially overbought market turning downward."
    ),
]
