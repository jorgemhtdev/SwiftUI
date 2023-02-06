import Foundation

public class MainVM : ObservableObject {
    
    @Published var navigationItem: [Item] = []
    
    public init() {
        fetchData()
    }
    
    func fetchData() {
        
        get(url: EndPoint.pois, type: ListItem.self, onSuccess: { data in
            self.navigationItem = data.list
        }, onFailure: { error in
            print(error)
        })
    }
    
}
