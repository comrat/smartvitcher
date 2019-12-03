Rectangle {
	id: posterDelegateProto;
	signal pressed;
	property string thumbnail: model.thumbnail_url;
	width: 250s;
	height: 200s;
	transform.scale: activeFocus ? 1.2 : 1.0;
	color: consts.panelColor;
	clip: true;
	z: activeFocus ? parent.z + 1 : parent.z;

	Image {
		id: videoPreview;
		width: 250s;
		height: 160s;
		property bool ready: status == Image.Ready;
	}

	Text {
		y: 163s;
		width: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		color: consts.textColor;
		font.pixelSize: 14s;
		wrapMode: Text.WordWrap;
		text: model.title;
	}

	ClickMixin { }
	FocusOnHoverMixin { }

	Border { width: parent.activeFocus ? 3s : 0; color: consts.accentTextColor; }

	updatePoster: { videoPreview.source = this.thumbnail.replace("%{width}", Math.floor(this.width * 1.5)).replace("%{height}", Math.floor(this.height * 1.5)) }
	onThumbnailChanged: { this.updatePoster() }

	onClicked: { this.pressed(model.index) }
	onSelectPressed: { this.pressed(model.index) }

	Behavior on transform { Animation { duration: consts.animationDuration; } }
}