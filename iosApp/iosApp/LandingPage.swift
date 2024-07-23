import SwiftUI

struct LandingPage: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 16) {
                
                    VStack(alignment: .leading, spacing: 0) {
                        
                        HeaderView(text: "For organizations and GIS professionals")
                                                 
                        LandingCardView(
                            title: "ArcGIS StoryMaps",
                            message: "Combine ArcGIS web maps, surveys, dashboards, and more into a unified digital experience.",
                            buttonText: "Sign into ArcGIS StoryMaps",
                            color: Color(hex: "41A78D")
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)


                    VStack(alignment: .leading, spacing: 0) {

                        HeaderView(
                            text: "For personal map based storytelling"
                        )
                        
                        LandingCardView(
                            title: "StoryMaps",
                            message: "Share your personal stories as immersive, interactive content featuring maps, media, and more.",
                            buttonText: "Sign into StoryMaps",
                            color: Color(hex: "#0067C4")
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)

                    Spacer()

                    Button("Maybe Later") {
                        // Handle maybe later
                    }
                    .padding()

                    Text("Compare ArcGIS StoryMaps and StoryMaps")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}

struct HeaderView: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Image(systemName: "info.circle")
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(text: "For orgs")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
