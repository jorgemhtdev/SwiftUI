import Foundation

public class MainVM : ObservableObject {
    
    @Published var navigationItem: [Item] = []
    
    public init() {
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://sergiocasero.es/pois.json")!
        
        get(url: url, type: ListItem.self, onSuccess: { data in
            self.navigationItem = data.list
        }, onFailure: { error in
            print(error)
        })
    }
    
}
