terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

# Search for tracks by Dolly Parton
data "spotify_search_track" "by_artist" {
    artist = "Anirudh Ravichander"
    #album = "Amaran"
    name  = "Hukum"
  #artist = "Dolly Parton"
  #limit  = 5  # Optional: specify the number of results to return
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Playlist 360"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    # Ensure that the track exists before referencing it
    length(data.spotify_search_track.by_artist.tracks) > 0 ? data.spotify_search_track.by_artist.tracks[0].id : null,
    length(data.spotify_search_track.by_artist.tracks) > 1 ? data.spotify_search_track.by_artist.tracks[1].id : null,
    length(data.spotify_search_track.by_artist.tracks) > 2 ? data.spotify_search_track.by_artist.tracks[2].id : null
  ]
}


# terraform {
#   required_providers {
#     spotify = {
#       version = "~> 0.2.6"
#       source  = "conradludgate/spotify"
#     }
#   }
# }

# provider "spotify" {
#   api_key = var.spotify_api_key
# }

# data "spotify_search_track" "by_artist" {
#   artist = "Dolly Parton"
#   #  album = "Jolene"
#   #  name  = "Early Morning Breeze"
# }

# resource "spotify_playlist" "playlist" {
#   name        = "Terraform Summer Playlist"
#   description = "This playlist was created by Terraform"
#   public      = true

#   tracks = [
#     data.spotify_search_track.by_artist.tracks[0].id,
#     data.spotify_search_track.by_artist.tracks[1].id,
#     data.spotify_search_track.by_artist.tracks[2].id,
#   ]
# }

# terraform {
#   required_providers {
#     spotify = {
#       source = "conradludgate/spotify"
#       version = "0.2.7"
#     }
#   }
# }
# provider "spotify" {
#   api_key = var.api_key
# }

# data "spotify_search_track" "by_artist" {
#   artist = "GV Prakash"
#     album = "Album"
#     name  = "Hey minnale"
# }

# resource "spotify_playlist" "playlist" {
#   name        = "Terraform Summer Playlist"
#   description = "This playlist was created by Terraform"
#   public      = true

#   tracks = [
#     data.spotify_search_track.by_artist.tracks[0].id,
#     data.spotify_search_track.by_artist.tracks[1].id,
#     data.spotify_search_track.by_artist.tracks[2].id,
#   ]
# }
