import Quickshell
import QtQuick

Rectangle {
	color: "#555555"
	anchors.right: parent.right
	bottomLeftRadius: 10
	bottomRightRadius: 10
	height: 25
	width: 150
	Text {
		anchors.verticalCenter: parent.verticalCenter
		text: Math.round(BatteryLogic.percent * 100) + "%"
		x: 105
	}
}
