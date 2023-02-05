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
                        NavigationLink(destination: MessageView(item: item)) {
                            ItemView(item: item)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .navDestination(with: Item.self) { item in
                if #available(iOS 16.0, *) {
                    MessageView(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Estadios de fútbol")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
