import SwiftUI

struct PlaceAnnotationView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showTitle = true
    
    let title: String
    let showColorItem:Bool
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .padding(8)
                .background(Rectangle()
                    .overlay(Material.ultraThin)
                    .opacity(0.6)
                    .cornerRadius(5))
                .opacity(showTitle ? 0 : 6)
            
            Image(systemName: "mappin.square.fill")
                .font(.title)
                .foregroundColor(showColorItem ? .red : .yellow)
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView(title: "String", showColorItem: false)
            .fixedSize()
    }
}
