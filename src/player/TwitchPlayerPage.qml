PageActivity {
	name: "player";

	IFrame {
		id: embed;
		anchors.fill: parent;
	}

	onStopped: {
		embed.source = ""
	}

	init(data, state): {
		var location = this._context.location
		log("location", location)
		var parent = "&parent=" + localhost.hostname
		var source = ""
		if (state && state.lastActivity == "clips")
			source = "https://clips.twitch.tv/embed?clip=" + data.id
		else if (state && state.lastActivity == "streams")
			source = "https://player.twitch.tv/?channel=" + data.user_name
		else
			source = "https://player.twitch.tv/?video=" + data.id
		embed.source = source + parent
	}
}
