web.api.Rest {
	property string clientId: "h1k5zmt0khmhmt8y8o7xp44xp9x5d8";
	baseUrl: "https://api.twitch.tv";

	function headers(headers) {
		headers["Client-ID"] = this.clientId
	}

	Method {
		name: "searchGame";
		path: "/helix/games?name={query}";
	}

	Method {
		name: "getTopGames";
		path: "/helix/games/top?first={limit}";
	}

	Method {
		name: "getStreams";
		path: "/helix/streams";
	}

	Method {
		name: "getVideos";
		path: "/helix/videos?id={videoId}";
	}

	Method {
		name: "getUserVideos";
		path: "/helix/videos?user_id={userId}";
	}

	Method {
		name: "getGameVideos";
		path: "/helix/videos?game_id={gameId}";
	}

	Method {
		name: "getUsers";
		path: "/helix/users?login={name}";
	}
}
