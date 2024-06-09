/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view, used as an attachment, that gives information about a point of interest.
*/

import SwiftUI
import RealityKit
import RealityKitContent

public struct LearnMoreView: View {

    let name: String
    let description: String
    let imageNames: [String]
    let trail: Entity?
    
    let viewModel: ViewModel
    
    @State private var showingMoreInfo = false
    @Namespace private var animation
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @State private var recordHistory: History?
    
    private var imagesFrame: Double {
        showingMoreInfo ? 326 : 50
    }
    
    private var titleFont: Font {
        .system(size: 48, weight: .semibold)
    }
    
    private var descriptionFont: Font {
        .system(size: 36, weight: .regular)
    }
    
    private var buttonFont: Font {
        .system(size: 25, weight: .regular)
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                if !showingMoreInfo {
                    Text(name)
                        .matchedGeometryEffect(id: "Name", in: animation)
                        .font(titleFont)
                        .padding()
                }
                
                if showingMoreInfo {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .matchedGeometryEffect(id: "Name", in: animation)
                            .font(titleFont)
                        
                        Text(description)
                            .font(descriptionFont)
                        
                        if !imageNames.isEmpty {
                            Spacer()
                                .frame(height: 10)
                            
                            ImagesView(imageNames: imageNames)
                        }
                        
                        Button(action: {
                            print("Button was tapped")
                            if isRecording {
                                recordHistory = endRecording()
                                print(recordHistory?.transcript ?? "no transcript")
                            } else {
                                startRecording()
                            }
                            isRecording.toggle()
                            print(isRecording)
                        }) {
                            Text(isRecording ? "Stop Recording" : "Start Recording")              .padding()
                                .foregroundColor(.white)
                                .font(buttonFont)
                                .cornerRadius(10)
                        }
                        if let history = recordHistory, history.transcript?.isEmpty == false {
                            HistoryView(history: history)
                        }
                        else{
                            
                        }
                    }
                }
            }
            .frame(width: 408)
            .padding(24)
            .greenBackground()
            .onTapGesture {
                withAnimation(.spring) {
                    showingMoreInfo.toggle()
                    
                    if var trailOpacity = trail?.components[ControlledOpacityComponent.self] {
                        trailOpacity.shouldShow = showingMoreInfo
                        trail?.components.set(trailOpacity)
                    }
                    
                    viewModel.updateRegionSpecificOpacity()
                }
            }
        }
    }
    private func startRecording() {
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
    }
    
    private func endRecording() -> History {
        speechRecognizer.stopTranscribing()
        let newHistory = History(position:name, transcript: speechRecognizer.transcript)
        return newHistory
    }
}

struct ImagesView: View {
    let imageNames: [String]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 250, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
        }
    }
}

struct HistoryView: View {
    let history: History


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                if let position = history.position{
                    Text("Position")
                        .font(.headline)
                    Text(position)
                }
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .padding()
    }
}



/*struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(position: "Left Engine",
                transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}*/

#Preview {
    RealityView { content, attachments in
        if let entity = attachments.entity(for: "z") {
            content.add(entity)
        }
    } attachments: {
        Attachment(id: "z") {
            LearnMoreView(name: "Phoenix Lake",
                          description: "Lake · Northern California",
                          imageNames: ["Landscape_2_Sunset"],
                          trail: nil,
                          viewModel: ViewModel())
        }
    }
}
