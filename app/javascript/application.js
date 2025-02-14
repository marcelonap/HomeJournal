import { Turbo } from "turbo-rails"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus"
import { createConsumer } from "@rails/actioncable"

const application = Application.start()

// Load all Stimulus controllers from the controllers directory
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

// Create the ActionCable consumer
const consumer = createConsumer()

export { application, consumer }
