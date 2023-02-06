import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var location = LocationService()
    
    @State private var presentSheet = false
    @State var offset:CGSize = CGSize.zero
    @State var loadView:Bool = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: DefaultRegion.latitude, longitude: DefaultRegion.longitude), span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    
    var annotationItems: [CustomItemAnnotation] = [CustomItemAnnotation(coordinate: CLLocationCoordinate2D(latitude: DefaultRegion.latitude, longitude: DefaultRegion.longitude), showItemText: false)]
    
    let item:Item
    
    init(item:Item) {
        annotationItems.append(CustomItemAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.coordinates.latitude, longitude: item.coordinates.longitude), showItemText: true))
        
        self.item = item
    }
    
    var body: some View {
        ZStack {
            
            Map(coordinateRegion: $location.userLocation,
                showsUserLocation: true,
                annotationItems: annotationItems) { mapPin in
                MapAnnotation(coordinate: mapPin.coordinate) {
                    PlaceAnnotationView(title: mapPin.showItemText ? item.title : "map-view-annotation-view", showColorItem: mapPin.showItemText)
                }
            }.ignoresSafeArea()
            
            if loadView {
                VStack {
                    Spacer()
                    
                    if !location.userHasLocation {
                        VStack {
                            Link("map-view-permisos-ubc", destination: URL(string: UIApplication.openSettingsURLString)!)
                                .font(.title)
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                .padding(8)
                                .background(Rectangle()
                                    .overlay(Material.ultraThin)
                                    .opacity(0.6)
                                    .cornerRadius(5))
                        }
                    }
                    
                    Button() {
                        presentSheet = true
                    } label: {
                        Image(systemName: "menubar.arrow.up.rectangle")
                            .foregroundColor(.primary)
                            .font(.largeTitle)
                    }
                    .showSheetMap(presentSheet: $presentSheet) {
                        SheetInfo(item: item)
                    }
                    .padding()
                    
           
                }
            }
        }.onAppear {
            location.checkUserAuthorization()
            presentSheet.toggle()
            loadView = true
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(item: itemData)
    }
}
