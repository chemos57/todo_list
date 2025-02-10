// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free"

// Load all the controllers within this directory and all subdirectories
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

// Initialize Stimulus application
const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

// Bootstrap initialization
document.addEventListener("turbo:load", () => {
  // Initialize all Bootstrap tooltips
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

  // Initialize all Bootstrap popovers
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
  const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
})

// Global JavaScript functions
window.toggleVisibility = function(elementId) {
  const element = document.getElementById(elementId)
  if (element) {
    element.classList.toggle('hidden')
  }
}

// Custom event handlers
document.addEventListener("turbo:load", () => {
  // Handle dynamic content loading
  setupDynamicContent()

  // Initialize third-party libraries
  initializeThirdPartyLibraries()
})

// Handle Turbo Drive navigation
document.addEventListener("turbo:before-cache", () => {
  // Clean up any initialized Bootstrap components
  const tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]')
  tooltips.forEach(tooltip => {
    const instance = bootstrap.Tooltip.getInstance(tooltip)
    if (instance) {
      instance.dispose()
    }
  })
})

// Helper functions
function setupDynamicContent() {
  // Setup handlers for dynamically loaded content
  document.addEventListener("click", (event) => {
    if (event.target.matches(".dynamic-load-trigger")) {
      // Handle dynamic content loading
    }
  })
}

function initializeThirdPartyLibraries() {
  // Initialize any third-party libraries that need to be setup after page load
  if (typeof someThirdPartyLibrary !== 'undefined') {
    // Initialize third-party library
  }
}

// Error handling
window.addEventListener("error", (event) => {
  console.error("Global error handler:", event.error)
  // You might want to send this to your error tracking service
})

// Prevent form double submissions
document.addEventListener("turbo:submit-start", (event) => {
  const submitter = event.target.querySelector("[type=submit]")
  if (submitter) {
    submitter.disabled = true
  }
})
