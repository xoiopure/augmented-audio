// = copyright ====================================================================
// Continuous: Live-looper and performance sampler
// Copyright (C) 2022  Pedro Tacla Yamada
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// = /copyright ===================================================================
import SwiftUI

struct SceneDragRect: View {
    @EnvironmentObject var _store: Store
    var dragState: SceneDragState
    var body: some View {
        TrackButton(
            action: {},
            label: scenes[dragState.scene],
            isSelected: false
        )
    }
}

struct SceneDragOverlayView: View {
    @ObservedObject var focusState: FocusState

    var body: some View {
        ZStack {
            if let dragState = focusState.sceneDragState {
                SceneDragRect(dragState: dragState)
                    .position(dragState.position)
                    .opacity(0.7)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .allowsHitTesting(false)
    }
}

struct GlobalOverlays: View {
    @EnvironmentObject var store: Store

    var body: some View {
        ZStack {
            SceneDragOverlayView(focusState: store.focusState)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .allowsHitTesting(false)
    }
}
