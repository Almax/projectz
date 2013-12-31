# Define
module.exports = badgeUtil =
	miscBadges:
		# Get Travis CI Badge
		travis: (opts={}) ->
			# Check
			return ''  if !opts.badges.travis or !opts.username or !opts.name

			# Return
			return """
				[![Build Status](http://img.shields.io/travis-ci/#{opts.username}/#{opts.name}.png?branch=master)](http://travis-ci.org/#{opts.username}/#{opts.name} "Check this project's build status on TravisCI")
				"""

		# Get NPM Badge
		npm: (opts={}) ->
			# Check
			return ''  if !opts.badges.npm or !opts.name

			# Return
			return """
				[![NPM version](http://badge.fury.io/js/#{opts.name}.png)](https://npmjs.org/package/#{opts.name} "View this project on NPM")
				"""

		# Get David DM
		daviddm: (opts={}) ->
			# Check
			return ''  if !opts.badges.daviddm

			# Use the repo value, if it's available, and daviddm is simply "true".
			if opts.badges.daviddm is true and (opts.repo or false)
				url = "https://david-dm.org/#{opts.repo}"
			else
				# Otherwise, assume it's the github repository name.
				url = "https://david-dm.org/#{opts.badges.daviddm}"

			# Return
			return """
				[![Dependency Status](#{url}.png)](#{url})
				"""

	donationBadges:
		# Get Gittip Badge
		gittip: (opts={}) ->
			# Check
			return ''  if !opts.badges.gittip
			url = "https://www.gittip.com/#{opts.badges.gittip}/"

			# Return
			return """
				[![Gittip donate button](http://img.shields.io/gittip/#{opts.badges.gittip}.png)](#{url} "Donate weekly to this project using Gittip")
				"""

		# Get Flattr Badge
		flattr: (opts={}) ->
			# Check
			return ''  if !opts.badges.flattr
			url = "http://flattr.com/thing/#{opts.badges.flattr}"

			# Return
			return """
				[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](#{url} "Donate monthly to this project using Flattr")
				"""

		# Get Paypal Badge
		paypal: (opts={}) ->
			# Check
			return ''  if !opts.badges.paypal
			url = "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=#{opts.badges.paypal}"

			# Return
			return """
				[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](#{url} "Donate once-off to this project using Paypal")
				"""

	# Get Badges Section
	getBadgesSection: (opts={}) ->
		return badgeUtil.getTypedBadges('misc', opts)+'\n'+badgeUtil.getTypedBadges('donation', opts)

	# Get Donation Badges
	getTypedBadges: (type, opts={}) ->
		# Prepare
		results = []

		# Concatenate badges
		for own name,fn of badgeUtil[type+'Badges']
			result = fn.call(@, opts)
			results.push(result)  if result

		# Return
		return results.join('\n')
