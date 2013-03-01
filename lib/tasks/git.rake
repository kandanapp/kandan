namespace :git do
	require 'fileutils'

	IGNORE_REPOS = [
		"origin",
		"upstream",
	]

	TEAM_REPOS = {
		'donthorp' => 'git@github.com:donthorp/kandan.git',
		'gabceb' => 'git://github.com/gabceb/kandan-1.git',
		'fusion94' => 'git://github.com/fusion94/kandan.git',
		'SpencerCooley' => 'git://github.com/SpencerCooley/kandan.git',
		'jrgifford' => 'git://github.com/jrgifford/kandan.git',
		'mjtko' => 'git://github.com/mjtko/kandan.git',
	}

	def get_remotes
		remotes = []
		o = `git remote`.split("\n")
		o.each() do |r|
			next if IGNORE_REPOS.include?(r)
			remotes << r
		end

		return remotes
	end

	def get_user
		`git config --get github.user`.chop()
	end

	def get_team_repos
		repos = TEAM_REPOS
		repos.delete(get_user())
		return repos
	end
	
	desc "Add team upstream repos"
	task :add_team_repos do

		remotes = get_remotes()

		get_team_repos().each() do |k,v|
			if remotes.include?(k)
				puts "Skipping remote for #{k}. Already added."
				next
			end

			sh %{git remote add #{k} #{v}}
		end
	end

	desc "Prune removed branches from remotes"
	task :prune_team_repos do
		repos = get_team_repos()

		repos.each() do |k,v|
			sh %{git remote prune #{k}}
		end
	end
end
