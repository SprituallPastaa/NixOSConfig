import Quickshell
import QtQuick
import Quickshell.Widgets

Rectangle {
	color: "#555555"
	anchors.left: parent.left
	height: 25
	width: 150
	bottomLeftRadius: 10
	bottomRightRadius: 10

	Text {
		anchors.verticalCenter: parent.verticalCenter
		text: ClockLogic.time
		x: 25
	}
}
