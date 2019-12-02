Rectangle {
	width: activeFocus ? 230s : 70s;
	height: 100%;
	color: consts.accentPanelColor;
	clip: true;

	Highlighter {
		width: 100%;
		color: consts.focusPanelColor;
		cssTranslatePositioning: true;
		target: menuView;

		Behavior on transform, width { Animation { duration: consts.animationDuration; } }
	}

	ListView {
		id: menuView;
		y: 30s;
		width: 200s;
		height: 100%;
		keyNavigationWraps: false;
		delegate: Rectangle {
			width: 100%;
			height: 70s;

			Text {
				x: 75s;
				width: 100%;
				height: 100%;
				verticalAlignment: Text.AlignVCenter;
				font.pixelSize: 24s;
				color: consts.textColor;
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

	onRightPressed: {
		var children = root.children
		for (var i = 0; i < children.length; ++i) {
			var child = children[i]
			if (child.name === root.currentActivity) {
				child.setFocus()
				return true
			}
		}
	}

	Behavior on width { Animation { duration: consts.animationDuration; } }
}
