# Import
projectzUtil = require('./projectz-util')
badgeUtil = require('./badge-util')

# Define
module.exports = backerUtil =

	getSponsorsText: (opts) ->
		result = ''

		if opts.sponsors.length is 0
			# ignore
			result += "No sponsors yet! Will you be the first?\n\n"
			result += badgeUtil.getTypedBadges('donation', opts)
		else
			result += "These amazing people have contributed finances to this project:\n\n"
			result += '- '+(projectzUtil.getPersonText(sponsor)  for sponsor in opts.sponsors).join('\n- ')
			result += "\n\nBecome a sponsor!\n\n#{badgeUtil.getTypedBadges('donation', opts)}"
		return result

	getMaintainersText: (opts) ->
		result = ''

		if opts.maintainers.length is 0
			# ignore
			result += "No maintainers yet! Will you be the first?"
		else
			result += "These amazing people are maintaining this project:\n\n"
			result += '- '+(projectzUtil.getPersonText(maintainer)  for maintainer in opts.maintainers).join('\n- ')

		return result

	getContributorsText: (opts) ->
		result = ''

		if opts.contributors.length is 0
			# ignore
			result += "No contributors yet! Will you be the first?"
			result += "\n#{backerUtil.getContributeText(opts)}"
		else
			result += "These amazing people have contributed code to this project:\n\n"
			result += '- '+(projectzUtil.getPersonText(contributor)+" - [view contributions](https://github.com/#{opts.repo}/commits?author=#{contributor.username})"  for contributor in opts.contributors).join('\n- ')
			result += "\n\n#{backerUtil.getContributeText(opts, 'Become a contributor!')}"

		return result

	getContributeText: (opts, text) ->
		# Prepare
		file = 'Contributing.md'
		url = projectzUtil.getFileUrl(opts, file)
		text ?= "Discover how you can contribute by heading on over to the `#{file}` file."

		# Return
		return "[#{text}](#{url})"

	getBackerSection: (opts={}) ->
		# Check
		return '' if !opts.licenses

		# Prepare
		result = """
			## Backers

			### Maintainers

			#{backerUtil.getMaintainersText(opts)}

			### Sponsors

			#{backerUtil.getSponsorsText(opts)}

			### Contributors

			#{backerUtil.getContributorsText(opts)}
			"""

		# Return
		return result

	getBackerFile: (opts={}) ->
		# Check
		return '' if !opts.licenses

		# Prepare
		result = """
			# Backers

			## Maintainers

			#{backerUtil.getMaintainersText(opts)}

			## Sponsors

			#{backerUtil.getSponsorsText(opts)}

			## Contributors

			#{backerUtil.getContributorsText(opts)}
			"""

		# Return
		return result

	getContributeSection: (opts) ->
		# Prepare
		result = """
			## Contribute

			#{backerUtil.getContributeText(opts)}
			"""

		# Return
		return result
