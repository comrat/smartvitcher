Item {
	width: 100%;
	height: 70s;

	ListView {
		id: menuView;
		y: 30s;
		width: contentWidth;
		height: 100%;
		keyNavigationWraps: false;
		orientation: ListView.Horizontal;
		anchors.horizontalCenter: parent.horizontalCenter;
		delegate: Rectangle {
			width: 150s;
			height: 100%;

			Text {
				width: 100%;
				height: 100%;
				verticalAlignment: Text.AligVCenter;
				horizontalAlignment: Text.AligHCenter;
				font.pixelSize: 24s;
				color: parent.activeFocus ? consts.accentTextColor : consts.textColor;
				text: qsTr(model.text);
			}
		}
		model: ListModel {
			ListElement { text: "STREAMS"; }
			ListElement { text: "GAMES"; }
			ListElement { text: "USERS"; }
			ListElement { text: "CLIPS"; }
		}
	}

	onDownPressed: {
		var children = root.children
		for (var i = 0; i < children.length; ++i) {
			var child = children[i]
			if (child.name === root.currentActivity) {
				child.setFocus()
				return true
			}
		}
	}
}
