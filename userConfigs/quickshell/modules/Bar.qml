import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Niri 
import Quickshell.Widgets

PanelWindow {
	anchors {
		top: true
		left: true
		right: true
	}
	// margins {
	// 	top: 4
	//	left: 4
	//	right: 4
	//}
	color: "transparent"
	implicitHeight: 35

	RowLayout {
		anchors.fill: parent
		Rectangle {
			Layout.fillHeight: true
			Layout.fillWidth: true
			// radius: 8
			bottomLeftRadius: 8
			bottomRightRadius: 8
			color: "transparent"
			RowLayout {
				anchors.centerIn: parent
				spacing: 10
				Loader { active: true; sourceComponent: WorkspaceSwitcher{} }
			}
		}
	}
	Rectangle {
		Layout.fillHeight: true
		Layout.fillWidth: true
		z: 2
		Loader { active: true; sourceComponent: Clock {} }
	}
	Rectangle {
		Layout.fillHeight: true
		Layout.fillWidth: true
		z: 1
		x: 1770
		Loader { active: true; sourceComponent: Battery {} }
	}
}
