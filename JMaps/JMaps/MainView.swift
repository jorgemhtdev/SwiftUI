import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm = MainVM()
    
    var body: some View {
        CustomNavigation {
            List() {
                ForEach(vm.navigationItem) {item in
                    if #available(iOS 16.0, *) {
                        NavigationLink(value: item) {
                            ItemView(item: item)
                        }
                        .listRowSeparator(.hidden)
                        
                    } else {
                        NavigationLink(destination: MapView(item: item)) {
                            MapView(item: item)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                
            }
            .navDestination(with: Item.self) { item in
                if #available(iOS 16.0, *) {
                    MapView(item: item)
                }
            }
            .listStyle(.plain)
            .accessibility(identifier: "lista")
            .navigationTitle("main-view-title")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
