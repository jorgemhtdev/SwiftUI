import SwiftUI

struct ItemView: View {
    
    let item:Item
    
    var body: some View {
        ZStack {
            ImgStadium(img: item.image)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .cornerRadius(5)
            .padding(8)
            
            Label(item.title, systemImage: "sportscourt")
                .nameStadiumTextStyle()
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing])
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: itemData)
    }
}
