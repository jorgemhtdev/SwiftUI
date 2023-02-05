import Foundation
import MapKit

struct CustomItemAnnotation: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
    let showItemText:Bool
}

 // Sede liga española
 struct DefaultRegion {
     static let latitude = 40.4469
     static let longitude = -3.6557
 }
 
 struct Span {
     static let delta = 0.1
 }
