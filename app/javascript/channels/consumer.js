// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

// app/javascript/channels/consumer.js
import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

export default consumer