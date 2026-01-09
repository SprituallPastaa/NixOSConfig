import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

pragma Singleton

Singleton {
	id: batteryWidget
	readonly property var percent: {
		UPower.displayDevice.percentage
	}
	readonly property var status: {
		UPower.displayDevice.status
	}
}
