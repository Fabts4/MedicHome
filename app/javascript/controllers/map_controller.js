import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
   mapboxgl.accessToken = this.apiKeyValue
   this.map = new mapboxgl.Map({
     container: this.element,
     style: "mapbox://styles/mapbox/streets-v10"
   })

   this.#addMarkersToMap();
   this.#fitMapToMarkers();
   this.#currentPosition();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #currentPosition() {
    navigator.geolocation.getCurrentPosition(((success) => {
      const lng = success.coords.longitude
      const lat = success.coords.latitude

      new mapboxgl.Marker({
        color: "#E60F05"
      })
      .setLngLat([ lng, lat ]).addTo(this.map)
    }));
  }
}
