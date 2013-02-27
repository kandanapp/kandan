# Introduction
Since Kandan is a fully open-source app, we would appreciate if you dive in and start adding features, fixing bugs 
(what bugs?), and cleaning up the code.

If you’re going to contribute code then we need you to sign our [Contributor License Agreement](http://www.clahub.com/agreements/kandanapp/kandan) 
(hereafter referred to as CLA) which is modeled after the one that [NodeJS](http://nodejs.org) uses.

A CLA is a legal document in which you state you are entitled to contribute the code/documentation/translation 
to the project you’re contributing to and are willing to have it used in distributions and derivative works. This 
means that should there be any kind of legal issue in the future as to the origins and ownership of any particular 
piece of code, then that project has the necessary forms on file from the contributor(s) saying they were permitted 
to make this contribution.

The CLA also ensures that once you have provided a contribution, you cannot try to withdraw permission for its use at 
a later date. People and companies can therefore use that software, confident that they will not be asked to stop 
using pieces of the code at a later date.

# How to contribute

Third-party patches are essential for keeping Kandan great. We simply can't access the huge number of platforms and 
myriad configurations for running Kandan. We want to keep it as easy as possible to contribute changes that get things 
working in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance 
of keeping on top of things.

* Make sure you have a [GitHub Account](https://github.com/signup/free)
* Submit a ticket for your issue, assuming one does not already exist.
  * Clearly describe the issue including steps to reproduce when it is a bug.
  * Make sure you fill in the earliest version that you know has the issue.
* Fork the repository on GitHub

# Making Changes
* Get the latest code from Github
  * Fork the Main Kandan repository.
  * Clone your fork of the Kandan repository.
* Add a remote for the main Kandan repo 
  * To make things easier to integrate and to keep your fork up to date then you need to add the main Kandan repo as a remote reference.
  * `git remote add upstream https://github.com/kandanapp/kandan.git`
  * Then, when you need to pull the latest from the main Kandan repo, you just fetch and merge the MASTER branch:
  * `git fetch upstream`
  * `git merge upstream/master`
  * You can also use `git pull upstream master` if you want it all in one step.
* Make a branch for your changes
  * Create a branch from where you want to base your work.
  * Generally you'll want to branch from __MASTER__
  * Please use the naming convention "master-[issue-num]" for your branch name to help us keep track of what your patch actually fixes
* Push your code and make a pull request
 * Sign the [Contributor License Agreement](http://www.clahub.com/agreements/kandanapp/kandan)
 * Push your changes to your fork of the repository. 
 * `git push origin master-[issue-num]`
 * Submit a pull request to the Kandan main repository.

# Additional Resources
* More information on contributing
 * [Contributing Issues](https://github.com/kandanapp/kandan/wiki/How-to-Contribute-Issues)
* [Issue tracker](https://github.com/kandanapp/kandan/issues)
* [Contributor License Agreement](http://www.clahub.com/agreements/kandanapp/kandan)
* [General GitHub documentation](http://help.github.com/)
* [GitHub pull request documentation](http://help.github.com/send-pull-requests/)

# Additional Notes on CLA and Pull Requests
When we have multiple PRs for the same issue. We will choose the best or if equal the first. In the event the PR 
requestor has not signed the CLA, we'll give you at least 48 hours to sign and if we don't here back we'll take the 
PR from someone who has.



