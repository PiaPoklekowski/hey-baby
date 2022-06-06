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
      style: "mapbox://styles/aliciadb/cl3x6gtk1002i14oaz0knj415"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"
      // customMarker.data.hospital_id = marker.hospital_id
      customMarker.addEventListener('click', () => {
        document.querySelectorAll(".hospital_details").forEach((detail) => {
          detail.classList.add("d-none")
        })
        const marker_hospital = document.getElementById(marker.hospital_id)
        marker_hospital.classList.remove("d-none")
        // let content = document.querySelector(".mapboxgl-popup-content")
        // console.log("content:", content)
        // let contentContainer = document.querySelector("#hospital-content")
        // console.log("contentContainer:", contentContainer)
        // contentContainer.appendChild(content)
      })

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
        // .setPopup(popup)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 40, maxZoom: 15, duration: 0 })
  }
}
