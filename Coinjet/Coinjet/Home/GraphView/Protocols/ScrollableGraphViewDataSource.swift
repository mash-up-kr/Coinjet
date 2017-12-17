
import UIKit

public protocol ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double
    func numberOfPoints() -> Int // This now forces the same number of points in each plot.
}
