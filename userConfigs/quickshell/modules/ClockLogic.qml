import Quickshell
import QtQuick
pragma Singleton

Singleton {
	id: root
	readonly property string time: {
		Qt.formatDateTime(clock.date, "ddd d hh:mm")
	}
	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}

}
