import Foundation

struct Item: Identifiable, Hashable, Decodable {
    var idString:String = ""
    
    var id: Int {
        Int(idString) ?? 0
    }
    
    var coordinates: Coordinates {
        let coordinates = geocoordinates.components(separatedBy: ",")
        guard let latitudeString = coordinates.first, let latitude = Double(latitudeString), let longitudeString = coordinates.last, let longitude = Double(longitudeString) else {
            return Coordinates(latitude: 0, longitude: 0)
        }
        return Coordinates(latitude: latitude, longitude: longitude)
    }
    
    let title: String
    let geocoordinates: String
    let image: String

    private enum CodingKeys: String, CodingKey {
        case idString = "id"
        case title = "title"
        case geocoordinates = "geocoordinates"
        case image = "image"
    }
}

struct Coordinates {
    var latitude: Double
    var longitude: Double
}

struct ListItem: Decodable {
    let list: [Item]
}
