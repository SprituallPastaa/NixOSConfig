import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
	anchors.left: parent.left
	color: "#555555"
	height: 25
	width: 215
	bottomLeftRadius: 10
	bottomRightRadius: 10

	Rectangle {
		id:workspaceLayout
		anchors {
			verticalCenter: parent.verticalCenter
			left: parent.left
			right: parent.right
			leftMargin: 10
			rightMargin: 10
		}
	}

	RowLayout {
		anchors {
			verticalCenter: parent.verticalCenter
		}
		spacing: 5
		Repeater {
			model: niri.workspaces

			delegate: RowLayout {
				spacing: 5
				Rectangle {
					visible: index < 7
					width: 20; height:20
					radius: 12
					Layout.alignment: Qt.AlignCenter
					Layout.leftMargin: model.index == 1 ? 7 : 0
					color: model.isFocused ? "#ffffff" : "#444444"
					Text {
						text:  model.index
						anchors.centerIn: parent
					}
					MouseArea {
						anchors.fill: parent
						cursorShape: Qt.PointingHandCursor
						onClicked: niri.focusWorkspaceById(model.id)
					}
				}
			}
		}
	}
}
