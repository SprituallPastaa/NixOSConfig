import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Niri
import "./modules/"

ShellRoot {
	id: root

	Niri {
		id:niri
		Component.onCompleted: connect()

		onConnected: console.info("Connected to Niri")
		onErrorOccurred: function(error) {
			console.error("Niri error:", error)
		}
	}
	LazyLoader { active: true; component: Bar{} }
}
