import Foundation

var devHost = "https://sergiocasero.es"

var host = devHost

struct EndPoint {
    static let pois = URL(string: "\(host)/pois.json")!
}
