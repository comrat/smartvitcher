PageActivity {
	name: "player";

	IFrame {
		id: embed;
		anchors.fill: parent;

		constructor: {}

		onLoaded: {
frameDelayTimer.restart()
		}
	}

	Timer {
		id: frameDelayTimer;
		interval: 4000;

		onTriggered: {
			// var button = embed.element.dom.contentWindow.document.getElementById("mature-link")
			log("BUT", "DS", document.getElementById("mature-link"))
		}
	}

	// constructor: {
	// 	this.element.dom.id = "twitch-embed"
	// }

	init(data): {
		embed.source = "https://player.twitch.tv/?video=" + data.id
		// new Twitch.Embed("twitch-embed", {
		// 	width: this.width,
		// 	height: this.height
		// 	// channel: "monstercat"
		// });
	}
}
