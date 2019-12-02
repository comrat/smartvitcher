Image {
	id: posterDelegateProto;
	signal pressed;
	property string url: model.box_art_url;
	property bool ready: status == Image.Ready;
	width: 150s;
	height: 200s;
	transform.scale: activeFocus ? 1.2 : 1.0;
	z: activeFocus ? parent.z + 1 : parent.z;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		color: consts.textColor;
		font.pixelSize: 18s;
		wrapMode: Text.WordWrap;
		text: posterDelegateProto.ready ? "" : model.name;
	}

	ClickMixin { }
	FocusOnHoverMixin { }

	Border { width: parent.activeFocus ? 3s : 0; color: consts.accentTextColor; }

	updatePoster: { this.source = this.url.replace("{width}", Math.floor(this.width * 1.5)).replace("{height}", Math.floor(this.height * 1.5)) }
	onUrlChanged: { this.updatePoster() }
	onCompleted: { this.updatePoster(); this.style('background-color', "#424242") }

	onClicked: { this.pressed(model.index) }
	onSelectPressed: { this.pressed(model.index) }

	Behavior on transform { Animation { duration: consts.animationDuration; } }
}
