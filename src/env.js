module.exports = {
				appName: requireFromEnv('APP_NAME'),
				env: requireFromEnv('NODE_ENV'),
				port: parseInt(requireFromEnv('PORT'), 10),
				version: packageJson.version
}
