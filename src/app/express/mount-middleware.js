const express = require('express')
const { join } = require('path')

const attachLocals = require('./attach-locals')
const lastResortErrorHandler = require('./last-resort-error-handler')
const primeRequestContext = require('./prime-request-context')

function mountMiddleware ( app, env ) {
	app.use(attachLocals)
	app.use(lastResortErrorHandler)
	app.use(primeRequestContext)
	app.use(
		express.static(join(__dirname, '..', 'public'), { maxage: 86400000})
	)
}

module.exports = moumtMiddleware
