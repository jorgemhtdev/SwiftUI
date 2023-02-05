import SwiftUI

struct SheetInfo: View {
    
    @Environment(\.colorScheme) var colorScheme

    let item:Item

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ImgStadium(img: item.image)
                .frame(width: 75, height: 50)
                .cornerRadius(5)
                
                Spacer()
                
                Label(item.title, systemImage: "sportscourt")
                    .nameStadiumTextStyle()
                    .frame(height: 50)
                
            }
            .padding()
            
            Spacer()
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding()
            
            Spacer()
        }
        .padding(.top )
    }
}

struct SheetInfo_Previews: PreviewProvider {
    static var previews: some View {
        SheetInfo(item: itemData)
    }
}
