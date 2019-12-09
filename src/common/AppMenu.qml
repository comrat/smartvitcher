Rectangle {
	signal selected;
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
		y: 100s;
		width: 200s;
		height: 100%;
		keyNavigationWraps: false;
		delegate: Rectangle {
			width: 100%;
			height: 70s;

			Image {
				x: 10s;
				y: 10s;
				width: 50s;
				height: 50s;
				source: model.icon;
			}

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
			ListElement { text: "VIDEOS"; icon: "res/menu/videos.png"; activity: "videos"; }
			ListElement { text: "CLIPS"; icon: "res/menu/clips.png"; activity: "clips"; }
			ListElement { text: "STREAMS"; icon: "res/menu/streams.png"; activity: "streams"; }
		}

		onCurrentIndexChanged: { indexDelay.restart() }
	}

	Timer {
		id: indexDelay;
		interval: 700;

		onTriggered: { this.parent.selected(menuView.model.get(menuView.currentIndex)) }
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
