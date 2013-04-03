CHANGELOG
=========

#### [v1.2]
 * [1866fc8](http://github.com/kandanapp/kandan/commit/1866fc8) mini-revert __(Tony Guntharp)__
 * [8bbb11e](http://github.com/kandanapp/kandan/commit/8bbb11e) updating gems for 1.2 release __(Tony Guntharp)__
 * [5f15fbd](http://github.com/kandanapp/kandan/commit/5f15fbd) Merge pull request #244 from donthorp/kandan-174 __(Tony Guntharp)__
 * [19ff5c9](http://github.com/kandanapp/kandan/commit/19ff5c9) Fixes #174. Prints a pithy message if you misuse /me __(Don Thorp)__
 * [6209287](http://github.com/kandanapp/kandan/commit/6209287) Update .travis.yml __(Gabriel Cebrian)__
 * [930039c](http://github.com/kandanapp/kandan/commit/930039c) Merge pull request #238 from gabceb/180 __(James Gifford)__
 * [189e765](http://github.com/kandanapp/kandan/commit/189e765) Fixes to deal with empty channels __(Gabriel Cebrian)__
 * [c3cd3c4](http://github.com/kandanapp/kandan/commit/c3cd3c4) Updated some gems that were updated to work with Rails 3.2.13 __(Gabriel Cebrian)__
 * [ee1c31c](http://github.com/kandanapp/kandan/commit/ee1c31c) Implements infinite scrolling __(Gabriel Cebrian)__
 * [d3d6cde](http://github.com/kandanapp/kandan/commit/d3d6cde) Merge pull request #236 from brookr/master __(Tony Guntharp)__
 * [f08e759](http://github.com/kandanapp/kandan/commit/f08e759) Update instructions for deploying to Heroku __(Brook Riggio)__
 * [646bc8f](http://github.com/kandanapp/kandan/commit/646bc8f) Merge pull request #223 from mjtko/kandan-131 __(Tony Guntharp)__
 * [83de39a](http://github.com/kandanapp/kandan/commit/83de39a) Use #create! to ensure channel creation fails noisily if it doesn't validate correctly; ensure the primary channel is assigned to the primary user. __(Mark J. Titorenko)__
 * [df8f166](http://github.com/kandanapp/kandan/commit/df8f166) Merge pull request #235 from gabceb/kandan-234 __(Tony Guntharp)__
 * [7ac4113](http://github.com/kandanapp/kandan/commit/7ac4113) All links on header menu open in new tabs now __(Gabriel Cebrian)__
 * [16540f6](http://github.com/kandanapp/kandan/commit/16540f6) About page opens in a new page __(Gabriel Cebrian)__
 * [b757826](http://github.com/kandanapp/kandan/commit/b757826) Merge pull request #230 from gabceb/kandan-229 __(Tony Guntharp)__
 * [4aee581](http://github.com/kandanapp/kandan/commit/4aee581) Updated gems __(Gabriel Cebrian)__
 * [60d6f53](http://github.com/kandanapp/kandan/commit/60d6f53) Merge pull request #228 from gabceb/kandan-227 __(Tony Guntharp)__
 * [3090013](http://github.com/kandanapp/kandan/commit/3090013) Updates kandan-count and kandan-count-dev __(Gabriel Cebrian)__
 * [829a790](http://github.com/kandanapp/kandan/commit/829a790) Merge pull request #222 from gabceb/kandan-207 __(Tony Guntharp)__
 * [7d9f4ca](http://github.com/kandanapp/kandan/commit/7d9f4ca) Merge pull request #221 from gabceb/kandan-219 __(Tony Guntharp)__
 * [4338246](http://github.com/kandanapp/kandan/commit/4338246) Slight refactoring; added comments about what is going on. :) __(Mark J. Titorenko)__
 * [828cd54](http://github.com/kandanapp/kandan/commit/828cd54) Increase capybara wait time to 10s for locating .chat-input. __(Mark J. Titorenko)__
 * [c21ace8](http://github.com/kandanapp/kandan/commit/c21ace8) Better user handling; better initialization callbacks. __(Mark J. Titorenko)__
 * [621fdf6](http://github.com/kandanapp/kandan/commit/621fdf6) fix abilities for channel ownership __(Mark J. Titorenko)__
 * [e6d30a4](http://github.com/kandanapp/kandan/commit/e6d30a4) Add users_controller and set as show/index resource in routes. __(Mark J. Titorenko)__
 * [0f35eb4](http://github.com/kandanapp/kandan/commit/0f35eb4) Remove obsolete additional attribute for channel JSON. __(Mark J. Titorenko)__
 * [adb613d](http://github.com/kandanapp/kandan/commit/adb613d) Channels now need a user. __(Mark J. Titorenko)__
 * [91d40be](http://github.com/kandanapp/kandan/commit/91d40be) Introduce channel ownership; delete button only displayed for destroyable channels (non-primary, owned, or all except primary channel if you're an admin). __(Mark J. Titorenko)__
 * [b6b983a](http://github.com/kandanapp/kandan/commit/b6b983a) Don't render delete button unless channel metadata contains trueish destroyable flage. __(Mark J. Titorenko)__
 * [3de5e3a](http://github.com/kandanapp/kandan/commit/3de5e3a) Add authorization for channels; initial implementation is such that only administrators may delete channels. (refs #131, #154) __(Mark J. Titorenko)__
 * [df305ae](http://github.com/kandanapp/kandan/commit/df305ae) Fixes MySql support __(Gabriel Cebrian)__
 * [883f927](http://github.com/kandanapp/kandan/commit/883f927) Implementation of plugin chaining. __(Gabriel Cebrian)__
 * [ff6530a](http://github.com/kandanapp/kandan/commit/ff6530a) Merge pull request #213 from mjtko/feature/decouple-configuration-from-assets __(Gabriel Cebrian)__
 * [d4a857f](http://github.com/kandanapp/kandan/commit/d4a857f) Moved nowThreshold and timestampRefreshInterval to kandan_settings.yml for consistency. __(Mark J. Titorenko)__
 * [d92fb81](http://github.com/kandanapp/kandan/commit/d92fb81) Pass configuration through the DOM rather than relying on ERB rendering, removing the coupling between rendered assets and the backend application configuration in place at time of rendering. __(Mark J. Titorenko)__
 * [82cfd2c](http://github.com/kandanapp/kandan/commit/82cfd2c) Merge pull request #212 from mjtko/fix/repeated-id __(Gabriel Cebrian)__
 * [6f2b972](http://github.com/kandanapp/kandan/commit/6f2b972) Make capybara await the presence of the .chat-input before #find-ing it. __(Mark J. Titorenko)__
 * [989d673](http://github.com/kandanapp/kandan/commit/989d673) Merge pull request #214 from fusion94/kandan-198 __(Gabriel Cebrian)__
 * [5a99802](http://github.com/kandanapp/kandan/commit/5a99802) adds proper css badging to admins. Fixes #198 __(Tony Guntharp)__
 * [f086bac](http://github.com/kandanapp/kandan/commit/f086bac) oy.... __(Tony Guntharp)__
 * [9ea95bc](http://github.com/kandanapp/kandan/commit/9ea95bc) Refactor integration tests to allow configuration of Faye port for testing. __(Mark J. Titorenko)__
 * [6187c23](http://github.com/kandanapp/kandan/commit/6187c23) Remove non-unique ID - chatbox template is used for each channel so we can't use an ID here (without violating standards anyway!) __(Mark J. Titorenko)__
 * [fc93ad8](http://github.com/kandanapp/kandan/commit/fc93ad8) Merge pull request #211 from fusion94/kandan-208 __(Don Thorp)__
 * [712ef34](http://github.com/kandanapp/kandan/commit/712ef34) support for ruby 2.0.0 added to travis-ci __(Tony Guntharp)__
 * [bbc4ccb](http://github.com/kandanapp/kandan/commit/bbc4ccb) removing 1.9.3 from Gemfile. Supports ruby 2.0 __(Tony Guntharp)__
 * [c03cf0b](http://github.com/kandanapp/kandan/commit/c03cf0b) Update out of date gems Fixes #208 __(Tony Guntharp)__
 * [8b49252](http://github.com/kandanapp/kandan/commit/8b49252) Merge pull request #210 from gabceb/kandan-209 __(Tony Guntharp)__
 * [ae6b41a](http://github.com/kandanapp/kandan/commit/ae6b41a) Fixed faye host bug for production __(Gabriel Cebrian)__
 * [6c2b3fe](http://github.com/kandanapp/kandan/commit/6c2b3fe) Merge pull request #206 from oponder/front_end_tests_with_poltergeist __(Gabriel Cebrian)__
 * [c592bef](http://github.com/kandanapp/kandan/commit/c592bef) remove branching on Rails.env for faye urls __(Oliver Ponder)__
 * [74967a7](http://github.com/kandanapp/kandan/commit/74967a7) Increase poltergeist timeout to see if it passes travis build __(Oliver Ponder)__
 * [51837e1](http://github.com/kandanapp/kandan/commit/51837e1) Merge pull request #202 from oponder/add_youtube_embed __(Tony Guntharp)__
 * [6c89ac3](http://github.com/kandanapp/kandan/commit/6c89ac3) Make sure the app connects to the test faye when it is in the test environment __(Oliver Ponder)__
 * [8c0ba3e](http://github.com/kandanapp/kandan/commit/8c0ba3e) Add an ID to the chat textarea so the test can find it easily __(Oliver Ponder)__
 * [bd44210](http://github.com/kandanapp/kandan/commit/bd44210) Add requires and setup for new gems. Spin up Faye in a seperate thread and port. __(Oliver Ponder)__
 * [911570a](http://github.com/kandanapp/kandan/commit/911570a) Ensures headless JS server and testing environment are connecting to same database __(Oliver Ponder)__
 * [47e6f19](http://github.com/kandanapp/kandan/commit/47e6f19) Add a proof of concept login test __(Oliver Ponder)__
 * [c95ab13](http://github.com/kandanapp/kandan/commit/c95ab13) Add gems that help with testing JS __(Oliver Ponder)__
 * [804b508](http://github.com/kandanapp/kandan/commit/804b508) Merge pull request #203 from mjtko/feature/atwho-regex-improvements __(Tony Guntharp)__
 * [bd8fbc2](http://github.com/kandanapp/kandan/commit/bd8fbc2) Use master jqeury.atwho.js incorporating ichord/At.js#51 __(Mark J. Titorenko)__
 * [4f12e3d](http://github.com/kandanapp/kandan/commit/4f12e3d) Fix broken whitespace __(Mark J. Titorenko)__
 * [ca74879](http://github.com/kandanapp/kandan/commit/ca74879) Improvements to atwho regexes to only match at start of line or after whitespace. (Fixes #157) __(Mark J. Titorenko)__
 * [b80f097](http://github.com/kandanapp/kandan/commit/b80f097) Was missing a comma, not sure if it mattered though. __(Oliver Ponder)__
 * [7e653d6](http://github.com/kandanapp/kandan/commit/7e653d6) Issue #196 - Youtube plugin should embed video __(Oliver Ponder)__
 * [374e568](http://github.com/kandanapp/kandan/commit/374e568) Merge pull request #201 from mjtko/feature/updated-mention-sound __(Gabriel Cebrian)__
 * [f2240b0](http://github.com/kandanapp/kandan/commit/f2240b0) Remove MP3 files (not currently supported in Firefox or Opera); added threetone-alert.wav to replace gong.mp3 for mention sounds; updated music_player to remove references to unused/obsolete MP3s. __(Mark J. Titorenko)__
 * [7530273](http://github.com/kandanapp/kandan/commit/7530273) Merge pull request #199 from mjtko/feature/chatbox-emojis-preview __(Gabriel Cebrian)__
 * [c6ad98b](http://github.com/kandanapp/kandan/commit/c6ad98b) Preview emojis in chatbox. __(Mark J. Titorenko)__
 * [e3479c0](http://github.com/kandanapp/kandan/commit/e3479c0) Merge pull request #195 from mjtko/feature/chatbox-history __(Gabriel Cebrian)__
 * [61f9614](http://github.com/kandanapp/kandan/commit/61f9614) Rework logic to remove confusion; add comment about why modifier keys are ignored. __(Mark J. Titorenko)__
 * [b47d9b4](http://github.com/kandanapp/kandan/commit/b47d9b4) Added 'history' capability to the chatbox input. __(Mark J. Titorenko)__
 * [022a643](http://github.com/kandanapp/kandan/commit/022a643) Merge pull request #194 from mjtko/kandan-192 __(Tony Guntharp)__
 * [fb51556](http://github.com/kandanapp/kandan/commit/fb51556) Remove use of obsolete border-radius mixins (fixes #192). __(Mark J. Titorenko)__
 * [ccd1ecf](http://github.com/kandanapp/kandan/commit/ccd1ecf) Merge pull request #191 from jjasghar/patch-1 __(Tony Guntharp)__
 * [fb7996e](http://github.com/kandanapp/kandan/commit/fb7996e) Update DEPLOY.md __(JJ Asghar)__
 * [38e0f6b](http://github.com/kandanapp/kandan/commit/38e0f6b) Update DEPLOY.md __(Tony Guntharp)__
 * [0a02634](http://github.com/kandanapp/kandan/commit/0a02634) Merge pull request #190 from gabceb/kandan-189 __(Tony Guntharp)__
 * [fddf0e1](http://github.com/kandanapp/kandan/commit/fddf0e1) Updated all development gems. Fixes #189 __(Gabriel Cebrian)__
 * [c143cc0](http://github.com/kandanapp/kandan/commit/c143cc0) Merge pull request #188 from fusion94/kandan-187 __(Don Thorp)__
 * [7f6f693](http://github.com/kandanapp/kandan/commit/7f6f693) Updated runtime gems to latest. Fixes #187 __(Tony Guntharp)__
 * [b653945](http://github.com/kandanapp/kandan/commit/b653945) Merge pull request #185 from gabceb/kandan-184 __(Tony Guntharp)__
 * [fd728f8](http://github.com/kandanapp/kandan/commit/fd728f8) Fixes Devise 2.0 migrations __(Gabriel Cebrian)__
 * [16d0108](http://github.com/kandanapp/kandan/commit/16d0108) Merge pull request #182 from gabceb/kandan-181 __(James Gifford)__
 * [371e0a0](http://github.com/kandanapp/kandan/commit/371e0a0) Updated devise and dependencies to latest version. __(Gabriel Cebrian)__
 * [11816d1](http://github.com/kandanapp/kandan/commit/11816d1) Update README.md __(Tony Guntharp)__
 * [ff7971d](http://github.com/kandanapp/kandan/commit/ff7971d) Update README.md __(Tony Guntharp)__
 * [634a35b](http://github.com/kandanapp/kandan/commit/634a35b) Added coverage status __(Tony Guntharp)__
 * [537f13d](http://github.com/kandanapp/kandan/commit/537f13d) Merge pull request #179 from fusion94/kandan-178 __(James Gifford)__
 * [26ec515](http://github.com/kandanapp/kandan/commit/26ec515) need to actually add the .coveralls.yml file __(Tony Guntharp)__
 * [9972104](http://github.com/kandanapp/kandan/commit/9972104) adding Coveralls suite Fixes #178 __(Tony Guntharp)__
 * [b88793e](http://github.com/kandanapp/kandan/commit/b88793e) adding email addresses __(Tony Guntharp)__
 * [4a0f6ee](http://github.com/kandanapp/kandan/commit/4a0f6ee) Update README.md __(Tony Guntharp)__
 * [a40fa42](http://github.com/kandanapp/kandan/commit/a40fa42) Merge pull request #175 from linjunpop/ruby-1.9.3 __(Tony Guntharp)__
 * [e7379e6](http://github.com/kandanapp/kandan/commit/e7379e6) Lock ruby version to 1.9.3. __(Jun Lin)__
 * [ca181a8](http://github.com/kandanapp/kandan/commit/ca181a8) Merge pull request #166 from fusion94/kandan-165 __(James Gifford)__
 * [8160c94](http://github.com/kandanapp/kandan/commit/8160c94) Merge pull request #173 from mjtko/kandan-170 __(Tony Guntharp)__
 * [9a37b1c](http://github.com/kandanapp/kandan/commit/9a37b1c) Merge pull request #172 from mjtko/kandan-171 __(Tony Guntharp)__
 * [c6727a7](http://github.com/kandanapp/kandan/commit/c6727a7) Merge pull request #169 from mjtko/kandan-168 __(Tony Guntharp)__
 * [c2eb6de](http://github.com/kandanapp/kandan/commit/c2eb6de) Handle channel creation across clients (Fixes #170). __(Mark J. Titorenko)__
 * [0f823a0](http://github.com/kandanapp/kandan/commit/0f823a0) Remote clients perform tab removal correctly for channel deletion (Fixes #171). __(Mark J. Titorenko)__
 * [942ab52](http://github.com/kandanapp/kandan/commit/942ab52) Send application activity for channel creation as well as deletion. __(Mark J. Titorenko)__
 * [b26b973](http://github.com/kandanapp/kandan/commit/b26b973) Wire up /me to ApisController#me action. __(Mark J. Titorenko)__
 * [0b9684c](http://github.com/kandanapp/kandan/commit/0b9684c) Merge pull request #167 from mjtko/kandan-135 __(Gabriel Cebrian)__
 * [f3aa968](http://github.com/kandanapp/kandan/commit/f3aa968) Confine disconnect/connect activities to primary channel (Fixes #135). __(Mark J. Titorenko)__
 * [59739d1](http://github.com/kandanapp/kandan/commit/59739d1) Added hubot.username to kandan.rake Fixes #165 __(Tony Guntharp)__
 * [0877f00](http://github.com/kandanapp/kandan/commit/0877f00) Merge pull request #109 from drdamour/patch-1 __(Tony Guntharp)__
 * [d1ecafc](http://github.com/kandanapp/kandan/commit/d1ecafc) Merge pull request #164 from mjtko/kandan-163 __(James Gifford)__
 * [2e3c481](http://github.com/kandanapp/kandan/commit/2e3c481) Reinstate faye requirement in Gemfile (Fixes #163). __(Mark J. Titorenko)__
 * [ed79097](http://github.com/kandanapp/kandan/commit/ed79097) Merge pull request #162 from jrgifford/master __(Tony Guntharp)__
 * [21cbcf9](http://github.com/kandanapp/kandan/commit/21cbcf9) Final removal of cloudfuji stuff __(James Gifford)__
 * [86986f7](http://github.com/kandanapp/kandan/commit/86986f7) Merge pull request #159 from gabceb/kandan_158 __(Tony Guntharp)__
 * [cfd28c3](http://github.com/kandanapp/kandan/commit/cfd28c3) Merge pull request #161 from gabceb/kandan-160 __(James Gifford)__
 * [fc64c7a](http://github.com/kandanapp/kandan/commit/fc64c7a) Removed last references of cloudfuji ido_id. Fixes #160 __(Gabriel Cebrian)__
 * [5e2b913](http://github.com/kandanapp/kandan/commit/5e2b913) Merges #142 __(James Gifford)__
 * [228731a](http://github.com/kandanapp/kandan/commit/228731a) Update README.md __(Tony Guntharp)__
 * [50975d0](http://github.com/kandanapp/kandan/commit/50975d0) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [0d4a0b0](http://github.com/kandanapp/kandan/commit/0d4a0b0) Adding items to make contribs clearer. Fixes #152 __(Tony Guntharp)__
 * [cd33520](http://github.com/kandanapp/kandan/commit/cd33520) Merge pull request #141 from gabceb/master __(Don Thorp)__
 * [331bdc1](http://github.com/kandanapp/kandan/commit/331bdc1) Moved current_user to the application layout. Fixes #158 __(Gabriel Cebrian)__
 * [a8aece6](http://github.com/kandanapp/kandan/commit/a8aece6) Merge branch 'master' of https://github.com/kandanapp/kandan __(Gabriel Cebrian)__
 * [c48996b](http://github.com/kandanapp/kandan/commit/c48996b) Merge pull request #151 from mjtko/proposal/fluidapp-notifications __(Gabriel Cebrian)__
 * [fc014cf](http://github.com/kandanapp/kandan/commit/fc014cf) Merge branch 'proposal/fluidapp-notifications' of git://github.com/mjtko/kandan __(Gabriel Cebrian)__
 * [e128e9f](http://github.com/kandanapp/kandan/commit/e128e9f) Fluid notifications (to support Fluid App, http://fluidapp.com) __(Mark J. Titorenko)__
 * [1eadbbd](http://github.com/kandanapp/kandan/commit/1eadbbd) Merge branch 'master' of https://github.com/kandanapp/kandan __(Gabriel Cebrian)__
 * [3b39026](http://github.com/kandanapp/kandan/commit/3b39026) Merge pull request #145 from mjtko/master-143 __(Gabriel Cebrian)__
 * [5ee7a46](http://github.com/kandanapp/kandan/commit/5ee7a46) Merge pull request #148 from mjtko/fix/remove-lobby-delete-button __(Don Thorp)__
 * [daf9f8c](http://github.com/kandanapp/kandan/commit/daf9f8c) Merge pull request #147 from mjtko/master-138 __(Don Thorp)__
 * [b338f4a](http://github.com/kandanapp/kandan/commit/b338f4a) Merge pull request #155 from donthorp/kandan-153 __(James Gifford)__
 * [3d3d1ef](http://github.com/kandanapp/kandan/commit/3d3d1ef) Merge branch 'master' into kandan-153 __(Don Thorp)__
 * [5902496](http://github.com/kandanapp/kandan/commit/5902496) Fixes #153. Add mjtko to git rake task __(Don Thorp)__
 * [7ba3ca6](http://github.com/kandanapp/kandan/commit/7ba3ca6) Merge branch 'master-133' of https://github.com/mjtko/kandan into 150 Fixes #150. __(James Gifford)__
 * [42873da](http://github.com/kandanapp/kandan/commit/42873da) Merge pull request #144 from mjtko/master-134 __(James Gifford)__
 * [6031deb](http://github.com/kandanapp/kandan/commit/6031deb) Enhanced notifications - now uses gong for @messages and ding for channel messages __(Mark J. Titorenko)__
 * [ccbb6a8](http://github.com/kandanapp/kandan/commit/ccbb6a8) Use '$' prefix convention to indicate jquery object variables __(Mark J. Titorenko)__
 * [b3f1e18](http://github.com/kandanapp/kandan/commit/b3f1e18) Remove 'delete channel' button from primary channel ('Lobby') __(Mark J. Titorenko)__
 * [903c87c](http://github.com/kandanapp/kandan/commit/903c87c) Fix deletion of newly created channels. __(Mark J. Titorenko)__
 * [9ea3256](http://github.com/kandanapp/kandan/commit/9ea3256) Fix search facility by setting current-user; factored current_user_data commonality into ApplicationHelper. __(Mark J. Titorenko)__
 * [bfedc7c](http://github.com/kandanapp/kandan/commit/bfedc7c) Allow configuration of avatar URL generation; remove obsolete template (current_user) __(Mark J. Titorenko)__
 * [a9e80bf](http://github.com/kandanapp/kandan/commit/a9e80bf) Removed ido_id from user factories __(Gabriel Cebrian)__
 * [2e02d3e](http://github.com/kandanapp/kandan/commit/2e02d3e) Revert "Fixed mentions regex to stop matching email addresses" __(Gabriel Cebrian)__
 * [01141bf](http://github.com/kandanapp/kandan/commit/01141bf) Removed unused ido_id from users table __(Gabriel Cebrian)__
 * [95eb878](http://github.com/kandanapp/kandan/commit/95eb878) Rename hubot to @kandanapp.com __(Gabriel Cebrian)__
 * [211cc51](http://github.com/kandanapp/kandan/commit/211cc51) Removed all cloudfuji code from kandan __(Gabriel Cebrian)__
 * [73ffc08](http://github.com/kandanapp/kandan/commit/73ffc08) Remove Airbrake code from project __(Gabriel Cebrian)__
 * [d526da8](http://github.com/kandanapp/kandan/commit/d526da8) Fixed mentions regex to stop matching email addresses __(Gabriel Cebrian)__
 * [b9c39e9](http://github.com/kandanapp/kandan/commit/b9c39e9) Merge pull request #140 from gabceb/master __(Tony Guntharp)__
 * [55252b5](http://github.com/kandanapp/kandan/commit/55252b5) Merge branch 'master' of https://github.com/kandanapp/kandan __(Gabriel Cebrian)__
 * [1566001](http://github.com/kandanapp/kandan/commit/1566001) Added kandan-count gems to production and development groups __(Gabriel Cebrian)__
 * [1ebc585](http://github.com/kandanapp/kandan/commit/1ebc585) Version 1.1 released. __(Tony Guntharp)__
 * [b13494f](http://github.com/kandanapp/kandan/commit/b13494f) Merge pull request #139 from gabceb/master __(James Gifford)__
 * [18df9fc](http://github.com/kandanapp/kandan/commit/18df9fc) Removing all references of cloudfuji profile icon from js templates __(Gabriel Cebrian)__
 * [ff10fba](http://github.com/kandanapp/kandan/commit/ff10fba) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [7e441b0](http://github.com/kandanapp/kandan/commit/7e441b0) Merge pull request #130 from jrgifford/updating-rails-for-security-patchs __(Gabriel Cebrian)__
 * [f68abe1](http://github.com/kandanapp/kandan/commit/f68abe1) Updated rails to fix security holes. __(James Gifford)__
 * [5690a56](http://github.com/kandanapp/kandan/commit/5690a56) Merge pull request #129 from gabceb/kandan_128 __(Tony Guntharp)__
 * [9d94081](http://github.com/kandanapp/kandan/commit/9d94081) Added check to make sure the # of rooms is respected when adding more rooms __(Gabriel Cebrian)__
 * [b0c0669](http://github.com/kandanapp/kandan/commit/b0c0669) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [d6ea111](http://github.com/kandanapp/kandan/commit/d6ea111) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [e1cb85f](http://github.com/kandanapp/kandan/commit/e1cb85f) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [6d0ae10](http://github.com/kandanapp/kandan/commit/6d0ae10) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [0da443c](http://github.com/kandanapp/kandan/commit/0da443c) Merge pull request #116 from gabceb/kandan_113 __(Don Thorp)__
 * [b367ccf](http://github.com/kandanapp/kandan/commit/b367ccf) Removed first and last name. Using full_name_or_username instead of full_name everywhere now __(Gabriel Cebrian)__
 * [e03e9d9](http://github.com/kandanapp/kandan/commit/e03e9d9) Merge pull request #125 from donthorp/issue-119 __(Tony Guntharp)__
 * [d6a3291](http://github.com/kandanapp/kandan/commit/d6a3291) Merge branch 'master' into issue-119 __(donthorp)__
 * [25cb0f7](http://github.com/kandanapp/kandan/commit/25cb0f7) Fixes #119. emoji with number underscore dash or plus ignored. __(donthorp)__
 * [bf59ed7](http://github.com/kandanapp/kandan/commit/bf59ed7) Merge pull request #117 from gabceb/kandan_114 __(Tony Guntharp)__
 * [10f87f6](http://github.com/kandanapp/kandan/commit/10f87f6) Merge pull request #124 from fusion94/master-123 __(Gabriel Cebrian)__
 * [b3fd34d](http://github.com/kandanapp/kandan/commit/b3fd34d) Making Ruby happy __(Gabriel Cebrian)__
 * [92f3ab1](http://github.com/kandanapp/kandan/commit/92f3ab1) Admin controller now uses suspend and activate methods __(Gabriel Cebrian)__
 * [7adc29e](http://github.com/kandanapp/kandan/commit/7adc29e) Added more code to bootstrap task to deal with upgrade cases. __(Gabriel Cebrian)__
 * [2b81b1c](http://github.com/kandanapp/kandan/commit/2b81b1c) moved version string to git_revision Fixes #123 __(Tony Guntharp)__
 * [bcf746c](http://github.com/kandanapp/kandan/commit/bcf746c) Merge pull request #121 from fusion94/master-120 __(Gabriel Cebrian)__
 * [f490117](http://github.com/kandanapp/kandan/commit/f490117) Adding Contributors to About page. Fixed #120 __(Tony Guntharp)__
 * [f8b1a39](http://github.com/kandanapp/kandan/commit/f8b1a39) Status is now registration_status all over the app __(Gabriel Cebrian)__
 * [138409d](http://github.com/kandanapp/kandan/commit/138409d) Merge pull request #118 from donthorp/rake-git-tasks __(Tony Guntharp)__
 * [802d93e](http://github.com/kandanapp/kandan/commit/802d93e) Add add_team_repos and prune_team_repos tasks to assist in PR handling __(donthorp)__
 * [17a3a19](http://github.com/kandanapp/kandan/commit/17a3a19) Merge pull request #115 from talltroym/fix-emoticon-typo __(Tony Guntharp)__
 * [c5b055a](http://github.com/kandanapp/kandan/commit/c5b055a) Fix trigger text for happy fave graphic with equal sign and right parenthesis __(Troy Murray)__
 * [6c1a1b0](http://github.com/kandanapp/kandan/commit/6c1a1b0) Fixed typo on admin.'s location for recompilation __(Gabriel Cebrian)__
 * [7896ffe](http://github.com/kandanapp/kandan/commit/7896ffe) Added default status for users. Closes #113 __(Gabriel Cebrian)__
 * [d5fe480](http://github.com/kandanapp/kandan/commit/d5fe480) Fix a typo that displayed a sad face graphic when a happy face emoticon was used __(Troy Murray)__
 * [1009b71](http://github.com/kandanapp/kandan/commit/1009b71) don't ask... __(Tony Guntharp)__
 * [bf322fe](http://github.com/kandanapp/kandan/commit/bf322fe) Merge pull request #112 from fusion94/master-110 __(Don Thorp)__
 * [6c91ecc](http://github.com/kandanapp/kandan/commit/6c91ecc) correcting a typo for xhtml compliance __(Tony Guntharp)__
 * [c8a83ec](http://github.com/kandanapp/kandan/commit/c8a83ec) Removed features from about messaging __(Tony Guntharp)__
 * [90cb909](http://github.com/kandanapp/kandan/commit/90cb909) Adding Git SHA to about page as well as some new messaging. __(Tony Guntharp)__
 * [7b57f80](http://github.com/kandanapp/kandan/commit/7b57f80) Merge pull request #108 from gabceb/CanCanAdmin __(Tony Guntharp)__
 * [4963b69](http://github.com/kandanapp/kandan/commit/4963b69) Small fixes from the code review __(Gabriel Cebrian)__
 * [4c15ac8](http://github.com/kandanapp/kandan/commit/4c15ac8) Make sure approved users have an admin checkbox when they are approved __(Gabriel Cebrian)__
 * [580eb64](http://github.com/kandanapp/kandan/commit/580eb64) Update DEPLOY.md __(drdamour)__
 * [e0ed0fb](http://github.com/kandanapp/kandan/commit/e0ed0fb) Added ability to have add admins __(Gabriel Cebrian)__
 * [9ac14de](http://github.com/kandanapp/kandan/commit/9ac14de) Small fixes __(Gabriel Cebrian)__
 * [53339a7](http://github.com/kandanapp/kandan/commit/53339a7) Javascript to handle users finished. Added check to make sure approved users are not stuck on the approval page. Same for suspended __(Gabriel Cebrian)__
 * [7b11928](http://github.com/kandanapp/kandan/commit/7b11928) Added a couple more messages to the bootstrap rake task __(Gabriel Cebrian)__
 * [d33aed7](http://github.com/kandanapp/kandan/commit/d33aed7) Added bootstrap to project. __(Gabriel Cebrian)__
 * [00a1620](http://github.com/kandanapp/kandan/commit/00a1620) Keep bots away from the sites. __(Gabriel Cebrian)__
 * [ad65897](http://github.com/kandanapp/kandan/commit/ad65897) Merge pull request #107 from donthorp/issue-106 __(Tony Guntharp)__
 * [1d3f3e5](http://github.com/kandanapp/kandan/commit/1d3f3e5) Fixes #106. =) shows wrong graphic __(donthorp)__
 * [f875d9e](http://github.com/kandanapp/kandan/commit/f875d9e) Merge pull request #104 from donthorp/kandan-15 __(Gabriel Cebrian)__
 * [ff66804](http://github.com/kandanapp/kandan/commit/ff66804) Extended emoticon plugin to support emoji for #15. Thanks to https://github.com/arvida/emoji-cheat-sheet.com for making this easy. __(donthorp)__
 * [834fef9](http://github.com/kandanapp/kandan/commit/834fef9) Added some js and actions to update a user status __(Gabriel Cebrian)__
 * [7e5c285](http://github.com/kandanapp/kandan/commit/7e5c285) Moved default values of kandan settings to kandan config yaml file __(Gabriel Cebrian)__
 * [101df98](http://github.com/kandanapp/kandan/commit/101df98) Added simple approval and suspended pages. Added filters to redirect users depending on the status. Moved about page to the pages controller __(Gabriel Cebrian)__
 * [ebb5f3f](http://github.com/kandanapp/kandan/commit/ebb5f3f) Initial implementation of admin console and site settings __(Gabriel Cebrian)__
 * [fd01af1](http://github.com/kandanapp/kandan/commit/fd01af1) Merge pull request #99 from gabceb/master __(Tony Guntharp)__
 * [fe1124f](http://github.com/kandanapp/kandan/commit/fe1124f) Added all to mentions __(Gabriel Cebrian)__
 * [4a1fa47](http://github.com/kandanapp/kandan/commit/4a1fa47) Merge pull request #97 from gabceb/master __(Tony Guntharp)__
 * [ac22801](http://github.com/kandanapp/kandan/commit/ac22801) Trying to fix notification buttons AGAIN! __(Gabriel Cebrian)__
 * [b961af3](http://github.com/kandanapp/kandan/commit/b961af3) Merge pull request #96 from gabceb/master __(Tony Guntharp)__
 * [5fcd900](http://github.com/kandanapp/kandan/commit/5fcd900) Addedd username to factory girl __(Gabriel Cebrian)__
 * [1b1ec67](http://github.com/kandanapp/kandan/commit/1b1ec67) Merge pull request #95 from gabceb/master-70 __(Tony Guntharp)__
 * [6c0ece5](http://github.com/kandanapp/kandan/commit/6c0ece5) Added uniqueness and presence for user's username __(Gabriel Cebrian)__
 * [459acb9](http://github.com/kandanapp/kandan/commit/459acb9) Room names added as unique. An error is now showed if an error occurred while creating a room. Updated backbone and underscore to latest versions __(Gabriel Cebrian)__
 * [9c07e55](http://github.com/kandanapp/kandan/commit/9c07e55) Merge pull request #92 from gabceb/master __(Tony Guntharp)__
 * [a7eb71e](http://github.com/kandanapp/kandan/commit/a7eb71e) Moved css from layout to application.css.sass __(Gabriel Cebrian)__
 * [99365b6](http://github.com/kandanapp/kandan/commit/99365b6) Merge pull request #91 from gabceb/master __(Tony Guntharp)__
 * [fa1af63](http://github.com/kandanapp/kandan/commit/fa1af63) Merge branch 'master' of https://github.com/kandanapp/kandan __(Gabriel Cebrian)__
 * [0d7eb34](http://github.com/kandanapp/kandan/commit/0d7eb34) Added mentions and at who plugin __(Gabriel Cebrian)__
 * [52b233c](http://github.com/kandanapp/kandan/commit/52b233c) Merge pull request #90 from gabceb/kanda-24 __(Tony Guntharp)__
 * [a986430](http://github.com/kandanapp/kandan/commit/a986430) Added notifications pane. __(Gabriel Cebrian)__
 * [f52250d](http://github.com/kandanapp/kandan/commit/f52250d) Merge pull request #89 from SpencerCooley/master __(Tony Guntharp)__
 * [97baf5a](http://github.com/kandanapp/kandan/commit/97baf5a) Merge branch 'master' of https://github.com/kandanapp/kandan __(Spencer)__
 * [623ff1b](http://github.com/kandanapp/kandan/commit/623ff1b) auto scroll is working on initial load and tab switch __(Spencer)__
 * [8a0c6f6](http://github.com/kandanapp/kandan/commit/8a0c6f6) Merge pull request #88 from skypanther/master __(Tony Guntharp)__
 * [025dca9](http://github.com/kandanapp/kandan/commit/025dca9) Added AppFog installation instructions __(Tim Poulsen)__
 * [026807e](http://github.com/kandanapp/kandan/commit/026807e) Merge pull request #84 from gabceb/master __(Tony Guntharp)__
 * [08cdef3](http://github.com/kandanapp/kandan/commit/08cdef3) Merge pull request #83 from gabceb/kandan-82 __(Tony Guntharp)__
 * [bf0f81d](http://github.com/kandanapp/kandan/commit/bf0f81d) Added logger to development env for Thin server __(Gabriel Cebrian)__
 * [35e30a3](http://github.com/kandanapp/kandan/commit/35e30a3) Added dummy deleted user to be used when a message associated with a user that has been deleted is shown __(Gabriel Cebrian)__
 * [b2053b7](http://github.com/kandanapp/kandan/commit/b2053b7) Merge pull request #80 from gabceb/master __(Tony Guntharp)__
 * [1e6a668](http://github.com/kandanapp/kandan/commit/1e6a668) Fixed references to some emoticons. Added GTFO emoticon image __(Gabriel Cebrian)__
 * [7cf6f98](http://github.com/kandanapp/kandan/commit/7cf6f98) Merge pull request #74 from gabceb/master __(Tony Guntharp)__
 * [a8b1392](http://github.com/kandanapp/kandan/commit/a8b1392) Updated file drop to latest version work with latest jquery where live is deprecated __(Gabriel Cebrian)__
 * [e23bb66](http://github.com/kandanapp/kandan/commit/e23bb66) Merge pull request #73 from gabceb/master __(Tony Guntharp)__
 * [5eb73d9](http://github.com/kandanapp/kandan/commit/5eb73d9) Removed unnecessary dummy thumb url __(Gabriel Cebrian)__
 * [a351bdd](http://github.com/kandanapp/kandan/commit/a351bdd) Added vimeo plugin __(Gabriel Cebrian)__
 * [b194115](http://github.com/kandanapp/kandan/commit/b194115) Merge pull request #71 from gabceb/master __(Tony Guntharp)__
 * [ed48045](http://github.com/kandanapp/kandan/commit/ed48045) Merge branch 'master' of https://github.com/kandanapp/kandan __(Gabriel Cebrian)__
 * [61dc435](http://github.com/kandanapp/kandan/commit/61dc435) Added real emoticons to emoticons plugin. __(Gabriel Cebrian)__
 * [3019dd2](http://github.com/kandanapp/kandan/commit/3019dd2) Merge pull request #68 from sergii/cleanup_actions __(James Gifford)__
 * [5f81fb8](http://github.com/kandanapp/kandan/commit/5f81fb8) Updated rails so we don't get bitten by the JSON bug.   CVE-2013-0276   CVE-2013-0277 __(James Gifford)__
 * [9231078](http://github.com/kandanapp/kandan/commit/9231078) Updated rails so we don't get bitten by the JSON bug. __(James Gifford)__
 * [aa2ffdd](http://github.com/kandanapp/kandan/commit/aa2ffdd) Clean up actions __(Sergii Ponomarov)__
 * [688b52a](http://github.com/kandanapp/kandan/commit/688b52a) Merge pull request #67 from SpencerCooley/master __(Tony Guntharp)__
 * [30d8fd3](http://github.com/kandanapp/kandan/commit/30d8fd3) took out rb-readline, fixed autoscroll for client. Still needs autscroll on push event. __(Spencer)__
 * [95bc6ee](http://github.com/kandanapp/kandan/commit/95bc6ee) Merge branch 'master' of https://github.com/kandanapp/kandan __(Spencer)__
 * [8738ad9](http://github.com/kandanapp/kandan/commit/8738ad9) fixed the autoscroll problem __(Spencer)__
 * [a0b07b5](http://github.com/kandanapp/kandan/commit/a0b07b5) Merge pull request #66 from SpencerCooley/master __(James Gifford)__
 * [949d504](http://github.com/kandanapp/kandan/commit/949d504) fixed all the weird spacing issues. __(Spencer)__
 * [bd3dcd6](http://github.com/kandanapp/kandan/commit/bd3dcd6) one more line __(Spencer)__
 * [bf1c359](http://github.com/kandanapp/kandan/commit/bf1c359) added one more line __(Spencer)__
 * [0e486c2](http://github.com/kandanapp/kandan/commit/0e486c2) added space at bottom of sass file to see if the \no new line thing would go away __(Spencer)__
 * [0035d13](http://github.com/kandanapp/kandan/commit/0035d13) fixed that weird gap that shows when the chat area is scrolled all the way to the top __(Spencer)__
 * [1269429](http://github.com/kandanapp/kandan/commit/1269429) Merge branch 'master' of https://github.com/kandanapp/kandan __(Spencer)__
 * [47ac582](http://github.com/kandanapp/kandan/commit/47ac582) fixed the global scroll __(Spencer)__
 * [9ef4b26](http://github.com/kandanapp/kandan/commit/9ef4b26) Create gen-changelog.sh __(Tony Guntharp)__
 * [a8d8212](http://github.com/kandanapp/kandan/commit/a8d8212) Merge pull request #65 from mguinada/fix-pastie __(Tony Guntharp)__
 * [e5c584b](http://github.com/kandanapp/kandan/commit/e5c584b) Fix message sender pastie link __(Miguel Guinada)__
 * [d555a07](http://github.com/kandanapp/kandan/commit/d555a07) Update CONTRIBUTING.md __(Tony Guntharp)__
 * [5790912](http://github.com/kandanapp/kandan/commit/5790912) Merge pull request #63 from gabceb/add_contributors_link_to_readme __(James Gifford)__
 * [f900bee](http://github.com/kandanapp/kandan/commit/f900bee) Added link to contributors of the Readme file __(Gabriel Cebrian)__
 * [8eaf7a8](http://github.com/kandanapp/kandan/commit/8eaf7a8) Merge pull request #62 from gabceb/add_left_margin_avatar __(Tony Guntharp)__
 * [e484567](http://github.com/kandanapp/kandan/commit/e484567) Added left margin to the avatar __(Gabriel Cebrian)__
 * [ad4f8c5](http://github.com/kandanapp/kandan/commit/ad4f8c5) Merge pull request #61 from gabceb/added_rgb_and_hex_color_plugin __(James Gifford)__
 * [555f7e9](http://github.com/kandanapp/kandan/commit/555f7e9) Added ability to have more than one hex or rgb on a message __(Gabriel Cebrian)__
 * [e91e0cd](http://github.com/kandanapp/kandan/commit/e91e0cd) Merge pull request #52 from gabceb/add_kandan_favicon __(Tony Guntharp)__
 * [fe683a8](http://github.com/kandanapp/kandan/commit/fe683a8) Renamed variables on hex plugin __(Gabriel Cebrian)__
 * [6c0271f](http://github.com/kandanapp/kandan/commit/6c0271f) Merge pull request #60 from gabceb/add_DS_Store_to_git_ignore __(Tony Guntharp)__
 * [606df32](http://github.com/kandanapp/kandan/commit/606df32) Merge pull request #59 from magicmarkker/master __(Tony Guntharp)__
 * [bcc6829](http://github.com/kandanapp/kandan/commit/bcc6829) Added plugins to show hex and rgb colors when they are used on messages __(Gabriel Cebrian)__
 * [4006ad2](http://github.com/kandanapp/kandan/commit/4006ad2) better scrolling in chat rooms __(Mark)__
 * [7d29af8](http://github.com/kandanapp/kandan/commit/7d29af8) Added DS_Store to the .gitignore file __(Gabriel Cebrian)__
 * [8f7f0f4](http://github.com/kandanapp/kandan/commit/8f7f0f4) CSS fix for Password errors do strange things to the layout __(Mark)__
 * [26da0df](http://github.com/kandanapp/kandan/commit/26da0df) Merge pull request #58 from scotje/patch-1 __(Tony Guntharp)__
 * [f0be264](http://github.com/kandanapp/kandan/commit/f0be264) Clarified self-hosted section of DEPLOY.md __(Jesse Scott)__
 * [e963183](http://github.com/kandanapp/kandan/commit/e963183) Added kandan favicon __(Gabriel Cebrian)__
 * [0fe77ee](http://github.com/kandanapp/kandan/commit/0fe77ee) Merge pull request #51 from Norrit/patch-1 __(James Gifford)__
 * [2285ee0](http://github.com/kandanapp/kandan/commit/2285ee0) Update DEPLOY.md __(Norbert Schneider)__
 * [3ae40df](http://github.com/kandanapp/kandan/commit/3ae40df) Create CHANGELOG.md __(Tony Guntharp)__

#### [v1.0]
 * [38f4875](http://github.com/kandanapp/kandan/commit/38f4875) Create CONTRIBUTING.md __(Tony Guntharp)__
 * [605c237](http://github.com/kandanapp/kandan/commit/605c237) Update README.md __(Tony Guntharp)__
 * [c42c82b](http://github.com/kandanapp/kandan/commit/c42c82b) Update README.md __(Tony Guntharp)__
 * [6c025a8](http://github.com/kandanapp/kandan/commit/6c025a8) Update README.md __(Tony Guntharp)__
 * [f5be2b4](http://github.com/kandanapp/kandan/commit/f5be2b4) Update README.md __(Tony Guntharp)__
 * [fadff2d](http://github.com/kandanapp/kandan/commit/fadff2d) Merge pull request #43 from fusion94/master __(James Gifford)__
 * [0646509](http://github.com/kandanapp/kandan/commit/0646509) Correctly set channel and user in bootstrapped messages thanks to @madx Fixes #32 __(Tony Guntharp)__
 * [46207f4](http://github.com/kandanapp/kandan/commit/46207f4) Merge pull request #41 from fusion94/master __(James Gifford)__
 * [809cf7b](http://github.com/kandanapp/kandan/commit/809cf7b) biggish commit on style. Fixes #13 #34 #36 #37 __(Tony Guntharp)__
 * [22a0816](http://github.com/kandanapp/kandan/commit/22a0816) Merge pull request #33 from kandanapp/update-paperclip __(Tony Guntharp)__
 * [75c4666](http://github.com/kandanapp/kandan/commit/75c4666) Updating paperclip, stage uno __(James Gifford)__
 * [8d4a9dd](http://github.com/kandanapp/kandan/commit/8d4a9dd) Merge pull request #30 from fusion94/master __(James Gifford)__
 * [a39ddbc](http://github.com/kandanapp/kandan/commit/a39ddbc) Moving from displaying email to displaying usernames, username is now required to register. Fixes #2 __(Tony Guntharp)__
 * [ae3f5a3](http://github.com/kandanapp/kandan/commit/ae3f5a3) Merge pull request #28 from amanelis/coverage __(Tony Guntharp)__
 * [40d3df8](http://github.com/kandanapp/kandan/commit/40d3df8) Added simplecov to spec helper __(Alex Manelis)__
 * [c74d2ed](http://github.com/kandanapp/kandan/commit/c74d2ed) Added coverage/ dir to gitignore __(Alex Manelis)__
 * [dcb131f](http://github.com/kandanapp/kandan/commit/dcb131f) Added simplecov to Gemfile __(Alex Manelis)__
 * [c6b9651](http://github.com/kandanapp/kandan/commit/c6b9651) Update README.md __(Tony Guntharp)__
 * [9bf68fa](http://github.com/kandanapp/kandan/commit/9bf68fa) Merge pull request #27 from jrgifford/upgrade-sass __(Tony Guntharp)__
 * [626cc2e](http://github.com/kandanapp/kandan/commit/626cc2e) updated to sass 3.2.5 __(James Gifford)__
 * [f762ba4](http://github.com/kandanapp/kandan/commit/f762ba4) Merge pull request #14 from jrgifford/local-installs __(Tony Guntharp)__
 * [69bed6a](http://github.com/kandanapp/kandan/commit/69bed6a) Fixes #8 __(James Gifford)__
 * [0c3e253](http://github.com/kandanapp/kandan/commit/0c3e253) added not pushing public/system/* to .gitignore. also set default channel to be named lobby. fixed #9 __(Tony Guntharp)__
 * [d112c8b](http://github.com/kandanapp/kandan/commit/d112c8b) Modified two things:   - travis.yml   - gemfile.lock to remove the dependency on git-based jasmine __(James Gifford)__
 * [4d770f5](http://github.com/kandanapp/kandan/commit/4d770f5) Merge pull request #5 from amanelis/spec-updates __(James Gifford)__
 * [253a030](http://github.com/kandanapp/kandan/commit/253a030) Fixes issue #6 __(Tony Guntharp)__
 * [350dde9](http://github.com/kandanapp/kandan/commit/350dde9) Merge remote branch kandan/master __(Alex Manelis)__
 * [7965928](http://github.com/kandanapp/kandan/commit/7965928) ci-skip added build status to readme __(James Gifford)__
 * [50e0e38](http://github.com/kandanapp/kandan/commit/50e0e38) Added travis.yml. __(James Gifford)__
 * [bf80a5e](http://github.com/kandanapp/kandan/commit/bf80a5e) correcting typo on a URL in README __(Tony Guntharp)__
 * [b453b72](http://github.com/kandanapp/kandan/commit/b453b72) adding links to UPDATE section of README __(Tony Guntharp)__
 * [f529046](http://github.com/kandanapp/kandan/commit/f529046) added an UPDATE section of the README __(Tony Guntharp)__
 * [291884a](http://github.com/kandanapp/kandan/commit/291884a) updating links in README __(Tony Guntharp)__
 * [3c47fcb](http://github.com/kandanapp/kandan/commit/3c47fcb) oops a typo __(Tony Guntharp)__
 * [dcb016e](http://github.com/kandanapp/kandan/commit/dcb016e) potential width fix __(Tony Guntharp)__
 * [840525f](http://github.com/kandanapp/kandan/commit/840525f) width issues __(Tony Guntharp)__
 * [d3131dd](http://github.com/kandanapp/kandan/commit/d3131dd) resolving file attachment issues __(Tony Guntharp)__
 * [628138f](http://github.com/kandanapp/kandan/commit/628138f) Removed rails default images, all tests pass :green_heart: __(Alex Manelis)__
 * [2ad13e5](http://github.com/kandanapp/kandan/commit/2ad13e5) Changed up when not authenticated __(Alex Manelis)__
 * [5409535](http://github.com/kandanapp/kandan/commit/5409535) Re wrote a few expects in model specs __(Alex Manelis)__
 * [827cde1](http://github.com/kandanapp/kandan/commit/827cde1) Changed up the before blocks, calling methods to many times __(Alex Manelis)__
 * [6c790fa](http://github.com/kandanapp/kandan/commit/6c790fa) Added faker gem for a few testing purposes __(Alex Manelis)__
 * [c712a4f](http://github.com/kandanapp/kandan/commit/c712a4f) Line for intialize on precompile found twice :trollface: __(Alex Manelis)__
 * [6e6ec3b](http://github.com/kandanapp/kandan/commit/6e6ec3b) Don't need to require factory_girl __(Alex Manelis)__
 * [89a59fa](http://github.com/kandanapp/kandan/commit/89a59fa) Added db cleaner to spec config __(Alex Manelis)__
 * [987a39a](http://github.com/kandanapp/kandan/commit/987a39a) Added db cleaner and a few other handy development gems __(Alex Manelis)__
 * [452962e](http://github.com/kandanapp/kandan/commit/452962e) Whitespace __(Alex Manelis)__
 * [a8a9442](http://github.com/kandanapp/kandan/commit/a8a9442) Slight modification to how the api controller spec is structured __(Alex Manelis)__
 * [4d81157](http://github.com/kandanapp/kandan/commit/4d81157) Removed rack-mini-profiler, decided wasn't worthy right now __(Alex Manelis)__
 * [46fa134](http://github.com/kandanapp/kandan/commit/46fa134) More factory girl updates to deprication __(Alex Manelis)__
 * [c572837](http://github.com/kandanapp/kandan/commit/c572837) Updated factory deprication for next __(Alex Manelis)__
 * [c94a8ee](http://github.com/kandanapp/kandan/commit/c94a8ee) Added some better gems for development __(Alex Manelis)__
 * [bc8e10d](http://github.com/kandanapp/kandan/commit/bc8e10d) Was already using sqlite locally :trollface: __(Alex Manelis)__
 * [84ea429](http://github.com/kandanapp/kandan/commit/84ea429) Added rvmrc to the gitignore file __(Alex Manelis)__
 * [000ea1f](http://github.com/kandanapp/kandan/commit/000ea1f) Merge pull request #36 from bielefeldt/master __(Sean Grove)__
 * [dead52c](http://github.com/kandanapp/kandan/commit/dead52c) README change with Heroku S3 integrations __(response)__
 * [baa502c](http://github.com/kandanapp/kandan/commit/baa502c) Update Readme __(Kev Zettler)__
 * [ba2c630](http://github.com/kandanapp/kandan/commit/ba2c630) Removed Cloudfuji references from readme __(Kev Zettler)__
 * [5b8bb9b](http://github.com/kandanapp/kandan/commit/5b8bb9b) Merge pull request #34 from jrgifford/master __(Kev Zettler)__
 * [5606ea4](http://github.com/kandanapp/kandan/commit/5606ea4) :heart: Guard, fixed specs to work with latest factory girl. __(James Gifford)__
 * [6978925](http://github.com/kandanapp/kandan/commit/6978925) Merge pull request #33 from jrgifford/master __(Kev Zettler)__
 * [a1fd6f9](http://github.com/kandanapp/kandan/commit/a1fd6f9) Updated rails to avoid ActionPack vuls. __(James Gifford)__

#### [v0.9]
 * [9227519](http://github.com/kandanapp/kandan/commit/9227519) correct SASS nesting for avatars __(Kev Zettler)__
 * [2d6391d](http://github.com/kandanapp/kandan/commit/2d6391d) Merge pull request #26 from ndbroadbent/css_fixes __(Kev Zettler)__
 * [5a135a1](http://github.com/kandanapp/kandan/commit/5a135a1) Use max-width and max-height to contstrain images, instead of height and width attributes. Also increased size slightly. __(Nathan Broadbent)__
 * [314a477](http://github.com/kandanapp/kandan/commit/314a477) Updated .posted_at bg color to match .current_user bg. Also properly nested CSS classes. __(Nathan Broadbent)__
 * [e84c1c2](http://github.com/kandanapp/kandan/commit/e84c1c2) Merge pull request #25 from MichaelEvans/master __(Sean Grove)__
 * [ee1359c](http://github.com/kandanapp/kandan/commit/ee1359c) Updating the README __(Sean Grove)__
 * [be27340](http://github.com/kandanapp/kandan/commit/be27340) Merge branch 'master' of github.com:MichaelEvans/kandan __(Michael Evans)__
 * [144aee5](http://github.com/kandanapp/kandan/commit/144aee5) posted messages now get the current_user class __(Michael Evans)__
 * [dad5070](http://github.com/kandanapp/kandan/commit/dad5070) posted messages now get the current_user class __(Michael Evans)__
 * [8ee8194](http://github.com/kandanapp/kandan/commit/8ee8194) Update the README with links to the Hubot app __(Sean Grove)__
 * [0056412](http://github.com/kandanapp/kandan/commit/0056412) Updated the README to encourage local hacking __(Sean Grove)__
 * [57eeced](http://github.com/kandanapp/kandan/commit/57eeced) Bumps the faye disconnect to 30 seconds to prevent errant drops __(Sean Grove)__
 * [0cccf3a](http://github.com/kandanapp/kandan/commit/0cccf3a) Merge branch 'master' of github.com:cloudfuji/kandan __(Sean Grove)__
 * [baf0fc7](http://github.com/kandanapp/kandan/commit/baf0fc7) Big update to enable Cloudfuji help __(Sean Grove)__
 * [9e97c9e](http://github.com/kandanapp/kandan/commit/9e97c9e) Merge pull request #18 from MichaelEvans/af47b5e22b386f5094813c16770d7bbdb4e1ea9f __(Sean Grove)__
 * [8cee08f](http://github.com/kandanapp/kandan/commit/8cee08f) added style for a users own messages __(Michael Evans)__
 * [af47b5e](http://github.com/kandanapp/kandan/commit/af47b5e) fixed logout link issue __(Michael Evans)__
 * [b43bfe7](http://github.com/kandanapp/kandan/commit/b43bfe7) Add in default database.yml.sample, closes #15 __(Sean Grove)__
 * [c259500](http://github.com/kandanapp/kandan/commit/c259500) Merge pull request #16 from adrnai/master __(Sean Grove)__
 * [3e1172f](http://github.com/kandanapp/kandan/commit/3e1172f) small typo __(Adrián)__
 * [1d74a87](http://github.com/kandanapp/kandan/commit/1d74a87) Constrain the height of file uploads widget and add overflow scrolling __(Kev Zettler)__
 * [91ac5d5](http://github.com/kandanapp/kandan/commit/91ac5d5) Merge branch 'master' of github.com:cloudfuji/kandan __(Sean Grove)__
 * [4df3dfa](http://github.com/kandanapp/kandan/commit/4df3dfa) Use this instead of webrick to start rails on your own VPS __(Sean Grove)__
 * [0621312](http://github.com/kandanapp/kandan/commit/0621312) Adds Errbit integration __(Sean Grove)__
 * [f9242f0](http://github.com/kandanapp/kandan/commit/f9242f0) Merge pull request #13 from willrax/logout_fix __(Kev Zettler)__
 * [dfce969](http://github.com/kandanapp/kandan/commit/dfce969) added in missing comma __(Will)__
 * [605d12d](http://github.com/kandanapp/kandan/commit/605d12d) changed logout link __(Will)__
 * [d398089](http://github.com/kandanapp/kandan/commit/d398089) proper mailing list link in readme __(Kev Zettler)__
 * [3f2ae90](http://github.com/kandanapp/kandan/commit/3f2ae90) updated readme added link to kandan home __(Kev Zettler)__
 * [c12d67e](http://github.com/kandanapp/kandan/commit/c12d67e) Use cloudfuji_paperclip with STS awareness __(Sean Grove)__
 * [7577714](http://github.com/kandanapp/kandan/commit/7577714) Notify user when dragging file over upload target __(Sean Grove)__
 * [dc69109](http://github.com/kandanapp/kandan/commit/dc69109) Revert back to standard paperclip until bug is fixed in cloudfuji_paperclip __(Sean Grove)__
 * [7c38556](http://github.com/kandanapp/kandan/commit/7c38556) Use 'cloudfuji-paperclip' for the STS support __(Sean Grove)__
 * [72a3929](http://github.com/kandanapp/kandan/commit/72a3929) Pass activityAttributes to Kandan.Helpers.Utils.notifyInTitleIfRequired() __(Sean Grove)__
 * [60d410b](http://github.com/kandanapp/kandan/commit/60d410b) Log the message to the console before notifying __(Sean Grove)__
 * [f2d1b16](http://github.com/kandanapp/kandan/commit/f2d1b16) Nicer bootstrap for rake cloudfuji:install, but at the cost of copy/paste __(Sean Grove)__
 * [3d12bca](http://github.com/kandanapp/kandan/commit/3d12bca) Great renaming __(Sean Grove)__
 * [cd2ff77](http://github.com/kandanapp/kandan/commit/cd2ff77) Touchup to the Cloud Foundry deploy instructions __(Sean Grove)__
 * [f70e14e](http://github.com/kandanapp/kandan/commit/f70e14e) Link to Cloudfuji in the README __(Sean Grove)__
 * [d48fbf1](http://github.com/kandanapp/kandan/commit/d48fbf1) Typo __(Sean Grove)__
 * [870f013](http://github.com/kandanapp/kandan/commit/870f013) Updates with Cloud Foundry install instructions __(Sean Grove)__
 * [846661e](http://github.com/kandanapp/kandan/commit/846661e) Update the sqlite gem __(Sean Grove)__
 * [5de9cc2](http://github.com/kandanapp/kandan/commit/5de9cc2) Merge pull request #12 from trisberg/master __(Sean Grove)__
 * [1f01b9b](http://github.com/kandanapp/kandan/commit/1f01b9b) Downgrading pg gem to 0.12.2 __(Thomas Risberg)__
 * [fea4686](http://github.com/kandanapp/kandan/commit/fea4686) More updates to README __(Sean Grove)__
 * [e8f88e7](http://github.com/kandanapp/kandan/commit/e8f88e7) Updates to the README __(Sean Grove)__
 * [e88c0e4](http://github.com/kandanapp/kandan/commit/e88c0e4) Merge pull request #11 from Bushido/emoticon_polish __(Kev Zettler)__
 * [49ac70c](http://github.com/kandanapp/kandan/commit/49ac70c) Merge branch 'master' into emoticon_polish __(Sean Grove)__
 * [55f8ecd](http://github.com/kandanapp/kandan/commit/55f8ecd) Merge branch 'master' of https://github.com/Bushido/kandan __(Kev Zettler)__
 * [bc69ef5](http://github.com/kandanapp/kandan/commit/bc69ef5) Emoticons should be rendered with message template __(Akash Manohar J)__
 * [6290306](http://github.com/kandanapp/kandan/commit/6290306) Adds title to emoticons __(Akash Manohar J)__
 * [9880f8f](http://github.com/kandanapp/kandan/commit/9880f8f) merged master __(Kev Zettler)__
 * [f8f3f2f](http://github.com/kandanapp/kandan/commit/f8f3f2f) Merge pull request #9 from Bushido/prerelease-fixes __(Kev Zettler)__
 * [2d4d784](http://github.com/kandanapp/kandan/commit/2d4d784) Fixes the extra-line bug when a message is posted __(Akash Manohar J)__
 * [1ef504f](http://github.com/kandanapp/kandan/commit/1ef504f) Checks for empty message by trim()ing the input __(Akash Manohar J)__
 * [74285fd](http://github.com/kandanapp/kandan/commit/74285fd) Fixes condition for adding message to channel __(Akash Manohar J)__
 * [2f9ea7e](http://github.com/kandanapp/kandan/commit/2f9ea7e) Fixes local activity times __(Akash Manohar J)__
 * [33e3fc0](http://github.com/kandanapp/kandan/commit/33e3fc0) Fakes faster messaging by clearing the textbox before saving the message __(Akash Manohar J)__
 * [7110c83](http://github.com/kandanapp/kandan/commit/7110c83) Audio refactoring __(Sean Grove)__
 * [880fc6d](http://github.com/kandanapp/kandan/commit/880fc6d) Only notify in the title or make a sound when a message happens in the channel we're in __(Sean Grove)__
 * [cef9e87](http://github.com/kandanapp/kandan/commit/cef9e87) Less console logging __(Sean Grove)__
 * [979a1b9](http://github.com/kandanapp/kandan/commit/979a1b9) Renamed cheer.mp3 => cheers.mp3 __(Sean Grove)__
 * [ec0a297](http://github.com/kandanapp/kandan/commit/ec0a297) Adds a few local sounds __(Sean Grove)__
 * [c3c467d](http://github.com/kandanapp/kandan/commit/c3c467d) Polished audio __(Sean Grove)__
 * [be19af7](http://github.com/kandanapp/kandan/commit/be19af7) Cleanup befor epushing for Akash __(Sean Grove)__
 * [5545290](http://github.com/kandanapp/kandan/commit/5545290) Prevent blank messages from being submitted __(Sean Grove)__
 * [b4d40ef](http://github.com/kandanapp/kandan/commit/b4d40ef) Handy-dandy super-dangerous unescape method in Kandan.Helpers.Utils __(Sean Grove)__
 * [c886229](http://github.com/kandanapp/kandan/commit/c886229) Skeleton of audio player in place __(Sean Grove)__
 * [d7dac42](http://github.com/kandanapp/kandan/commit/d7dac42) Fixes an emoticon and adds audio tags __(Sean Grove)__
 * [eb68a15](http://github.com/kandanapp/kandan/commit/eb68a15) Plays a ding for new messages when not focused __(Sean Grove)__
 * [60af992](http://github.com/kandanapp/kandan/commit/60af992) Adds emoticons __(Sean Grove)__
 * [017af93](http://github.com/kandanapp/kandan/commit/017af93) Merge pull request #4 from Bushido/emoticons __(Kev Zettler)__
 * [5e2369d](http://github.com/kandanapp/kandan/commit/5e2369d) Slightly bigger emoticons __(Sean Grove)__
 * [a9cf480](http://github.com/kandanapp/kandan/commit/a9cf480) truestory is a png, not jpg __(Sean Grove)__
 * [26440cc](http://github.com/kandanapp/kandan/commit/26440cc) Added emoticons and logic __(Sean Grove)__
 * [3584aba](http://github.com/kandanapp/kandan/commit/3584aba) Fixing emoticon regex __(Sean Grove)__
 * [6915765](http://github.com/kandanapp/kandan/commit/6915765) Initial implementation of emoticons __(Sean Grove)__
 * [13520aa](http://github.com/kandanapp/kandan/commit/13520aa) Merge pull request #3 from Bushido/style_fix __(Sean Grove)__
 * [c185893](http://github.com/kandanapp/kandan/commit/c185893) Fixes link embed regex __(Akash Manohar J)__
 * [8c3b7d4](http://github.com/kandanapp/kandan/commit/8c3b7d4) Fixes youtube regex __(Akash Manohar J)__
 * [b101d1e](http://github.com/kandanapp/kandan/commit/b101d1e) Fixes image regex __(Akash Manohar J)__
 * [1a50dcc](http://github.com/kandanapp/kandan/commit/1a50dcc) Fixes embed templates; escapes message content before passing it to plugins __(Akash Manohar J)__
 * [a5ef905](http://github.com/kandanapp/kandan/commit/a5ef905) Merge branch 'master' of github.com:Bushido/kandan into style_fix __(Akash Manohar J)__
 * [868b4fb](http://github.com/kandanapp/kandan/commit/868b4fb) Tweaks to the Heroku install section __(Sean Grove)__
 * [1025777](http://github.com/kandanapp/kandan/commit/1025777) Merge branch 'master' of github.com:Bushido/kandan __(Sean Grove)__
 * [c2cb394](http://github.com/kandanapp/kandan/commit/c2cb394) Adds initial instructions for deploying (in development mode) to a vps __(Sean Grove)__
 * [63fc1fa](http://github.com/kandanapp/kandan/commit/63fc1fa) Merge branch 'master' of github.com:Bushido/kandan into style_fix __(Akash Manohar J)__
 * [a373e32](http://github.com/kandanapp/kandan/commit/a373e32) Merge branch 'master' of github.com:Bushido/kandan __(Kev Zettler)__
 * [a73b605](http://github.com/kandanapp/kandan/commit/a73b605) Updates to the Heroku section of the README to explain you need the gem and a pre-existing account __(Sean Grove)__
 * [f53c6a8](http://github.com/kandanapp/kandan/commit/f53c6a8) fixes to grey header mask __(Kev Zettler)__
 * [c2afda3](http://github.com/kandanapp/kandan/commit/c2afda3) Removes the time_to_string helper method __(Akash Manohar J)__
 * [0ed1646](http://github.com/kandanapp/kandan/commit/0ed1646) Merges master and solves conflicts __(Akash Manohar J)__
 * [e868f93](http://github.com/kandanapp/kandan/commit/e868f93) Minor refactor; Centralizes the options in js and adds relative times __(Akash Manohar J)__
 * [58a8728](http://github.com/kandanapp/kandan/commit/58a8728) Fixed the random name method __(Sean Grove)__
 * [ddfc5d2](http://github.com/kandanapp/kandan/commit/ddfc5d2) Character doesn't come free __(Sean Grove)__
 * [5bc4e02](http://github.com/kandanapp/kandan/commit/5bc4e02) Adding a bit of character __(Sean Grove)__
 * [5f92e0b](http://github.com/kandanapp/kandan/commit/5f92e0b) README updates to get Heroku deploy straight copy/paste __(Sean Grove)__
 * [70a03ae](http://github.com/kandanapp/kandan/commit/70a03ae) Comment out the sqlite3 gem for Heroku compatibility by default __(Sean Grove)__
 * [437b8e5](http://github.com/kandanapp/kandan/commit/437b8e5) Tiny tweak to the link regex __(Sean Grove)__
 * [e023eb8](http://github.com/kandanapp/kandan/commit/e023eb8) Updated the README __(Sean Grove)__
 * [e449b81](http://github.com/kandanapp/kandan/commit/e449b81) Merge branch 'master' of github.com:Bushido/kandan __(Sean Grove)__
 * [36d5f77](http://github.com/kandanapp/kandan/commit/36d5f77) Added preview image __(Sean Grove)__
 * [d534fa5](http://github.com/kandanapp/kandan/commit/d534fa5) postgres -> postgresql __(Sean Grove)__
 * [887bc98](http://github.com/kandanapp/kandan/commit/887bc98) Added initial dotcloud.yml __(Sean Grove)__
 * [5af582c](http://github.com/kandanapp/kandan/commit/5af582c) Updated README __(Sean Grove)__
 * [8d461a9](http://github.com/kandanapp/kandan/commit/8d461a9) Added sqlite3 gem for local use __(Sean Grove)__
 * [775b900](http://github.com/kandanapp/kandan/commit/775b900) Added LICENSE __(Sean Grove)__
 * [7f40649](http://github.com/kandanapp/kandan/commit/7f40649) Added a rake kandan:bootstrap task __(Sean Grove)__
 * [0689f02](http://github.com/kandanapp/kandan/commit/0689f02) Merge branch 'master' of github.com:Bushido/Kandan __(Kev Zettler)__
 * [2d2ca54](http://github.com/kandanapp/kandan/commit/2d2ca54) dom additions for proper scroll rendering __(Kev Zettler)__
 * [e1c574a](http://github.com/kandanapp/kandan/commit/e1c574a) proper rendering for message scroll amazing amazing hacks __(Kev Zettler)__
 * [cb14e84](http://github.com/kandanapp/kandan/commit/cb14e84) Enhancements to the youtube embedder __(Sean Grove)__
 * [6b0da89](http://github.com/kandanapp/kandan/commit/6b0da89) Fix the youtube regex to be more flexible __(Sean Grove)__
 * [7a9a93c](http://github.com/kandanapp/kandan/commit/7a9a93c) Fall back to email when first name isn't present in the /me command __(Sean Grove)__
 * [05c0fbe](http://github.com/kandanapp/kandan/commit/05c0fbe) Use the escaped regex as a stopgap solution __(Sean Grove)__
 * [70dd9e3](http://github.com/kandanapp/kandan/commit/70dd9e3) Use the extracted url for image embedding __(Sean Grove)__
 * [32f05ec](http://github.com/kandanapp/kandan/commit/32f05ec) Updates the image embedding plugin __(Sean Grove)__
 * [3c61952](http://github.com/kandanapp/kandan/commit/3c61952) Avoid double-escaping strings __(Sean Grove)__
 * [ecb69f4](http://github.com/kandanapp/kandan/commit/ecb69f4) Merge branch 'master' of github.com:Bushido/Kandan __(Sean Grove)__
 * [df9783e](http://github.com/kandanapp/kandan/commit/df9783e) Escape incoming messages before any processes to avoid any malicious hijinks __(Sean Grove)__
 * [75990f8](http://github.com/kandanapp/kandan/commit/75990f8) Restrict faye broadcast messages to only the necessary fields __(Sean Grove)__
 * [43bb7aa](http://github.com/kandanapp/kandan/commit/43bb7aa) Add user email to the initial load __(Sean Grove)__
 * [d217418](http://github.com/kandanapp/kandan/commit/d217418) Adds a bit of logging __(Sean Grove)__
 * [89dc69c](http://github.com/kandanapp/kandan/commit/89dc69c) Merge pull request #2 from Bushido/heroku __(Kev Zettler)__
 * [c98a63b](http://github.com/kandanapp/kandan/commit/c98a63b) Merge branch 'heroku' of github.com:Bushido/Kandan into heroku __(Kev Zettler)__
 * [bd01552](http://github.com/kandanapp/kandan/commit/bd01552) Merge branch 'heroku' of github.com:Bushido/Kandan into heroku __(Sean Grove)__
 * [c21ed2b](http://github.com/kandanapp/kandan/commit/c21ed2b) Keep track of the unread activities for display in the browser tab __(Sean Grove)__
 * [43365db](http://github.com/kandanapp/kandan/commit/43365db) Include current_user.email in the initial page render __(Sean Grove)__
 * [f6661b1](http://github.com/kandanapp/kandan/commit/f6661b1) Fallback to email for current user in upper-right-hand corner if first name is null __(Sean Grove)__
 * [52efcc5](http://github.com/kandanapp/kandan/commit/52efcc5) Simpler logic for first_name vs email in activity history __(Sean Grove)__
 * [5886f62](http://github.com/kandanapp/kandan/commit/5886f62) Use email address in place of names when first name isn't present for activity listing __(Sean Grove)__
 * [99e84b9](http://github.com/kandanapp/kandan/commit/99e84b9) Defaults to user.email for the userlist plugin if user.first_name is not present __(Sean Grove)__
 * [e42416c](http://github.com/kandanapp/kandan/commit/e42416c) added min height for activity content __(Kev Zettler)__
 * [5233691](http://github.com/kandanapp/kandan/commit/5233691) Adds token_authenticatable back in as a standard devise module __(Sean Grove)__
 * [ede5d03](http://github.com/kandanapp/kandan/commit/ede5d03) Updates the standard Devise modules (off of Bushido) to match the database migrations __(Sean Grove)__
 * [40d8add](http://github.com/kandanapp/kandan/commit/40d8add) Require the configuration lib in application.rb since it's necessary for asset precompilation *and* we've disabled initialization for asset precompilation for Heroku compatibility __(Sean Grove)__
 * [b324222](http://github.com/kandanapp/kandan/commit/b324222) fixed delete channel on new channel bug __(Kev Zettler)__
 * [30364e6](http://github.com/kandanapp/kandan/commit/30364e6) Disable rails initialization on asset precompilation for Heroku compatibility __(Sean Grove)__
 * [e479f5a](http://github.com/kandanapp/kandan/commit/e479f5a) Use thin as websever via Procfile __(Sean Grove)__
 * [f990b54](http://github.com/kandanapp/kandan/commit/f990b54) Merge pull request #1 from Bushido/fixes __(Kev Zettler)__
 * [96c096d](http://github.com/kandanapp/kandan/commit/96c096d) Data attribute channel_id is now channel-id __(Akash Manohar J)__
 * [38b7377](http://github.com/kandanapp/kandan/commit/38b7377) Data attribute names should be dasherized __(Akash Manohar J)__
 * [f468170](http://github.com/kandanapp/kandan/commit/f468170) Fixes typos __(Akash Manohar J)__
 * [28b660f](http://github.com/kandanapp/kandan/commit/28b660f) Changes the casing in the Channels helper __(Akash Manohar J)__
 * [295e1ee](http://github.com/kandanapp/kandan/commit/295e1ee) More casing changes __(Akash Manohar J)__
 * [c0d0fab](http://github.com/kandanapp/kandan/commit/c0d0fab) Fixes pastie __(Akash Manohar J)__
 * [42e95cb](http://github.com/kandanapp/kandan/commit/42e95cb) Refactors code to follow github styleguide for javascript __(Akash Manohar J)__
 * [3714ad2](http://github.com/kandanapp/kandan/commit/3714ad2) Fixes the icon regex; Now displays the correct icons for audio and video extensions __(Akash Manohar J)__
 * [76241e6](http://github.com/kandanapp/kandan/commit/76241e6) Indents the file item template __(Akash Manohar J)__
 * [e6214f1](http://github.com/kandanapp/kandan/commit/e6214f1) Minor refactor __(Akash Manohar J)__
 * [2e05bd9](http://github.com/kandanapp/kandan/commit/2e05bd9) Sets max file size to 1000mb __(Akash Manohar J)__
 * [eec8272](http://github.com/kandanapp/kandan/commit/eec8272) Removes logging __(Akash Manohar J)__
 * [2fd9647](http://github.com/kandanapp/kandan/commit/2fd9647) Fixes text casing __(Akash Manohar J)__
 * [e16657c](http://github.com/kandanapp/kandan/commit/e16657c) Adds attachment#upload event to faye and some minor refactor __(Akash Manohar J)__
 * [b8c3e00](http://github.com/kandanapp/kandan/commit/b8c3e00) Adds events for attachments __(Akash Manohar J)__
 * [41b5042](http://github.com/kandanapp/kandan/commit/41b5042) File dropzone should only be inited once. Uses the monkey patch to filedrop jquery plugin __(Akash Manohar J)__
 * [d8d0d5e](http://github.com/kandanapp/kandan/commit/d8d0d5e) Monkey patches the jquery filedrop plugin to use url() as a function instead of a string __(Akash Manohar J)__
 * [3ef00e0](http://github.com/kandanapp/kandan/commit/3ef00e0) Seperates publishing for messages and uploads __(Akash Manohar J)__
 * [7b88b88](http://github.com/kandanapp/kandan/commit/7b88b88) Fixes file size by setting it to 100mb. Adds messages for errors __(Akash Manohar J)__
 * [c4baac9](http://github.com/kandanapp/kandan/commit/c4baac9) Fixes active users __(Akash Manohar J)__
 * [1de14a0](http://github.com/kandanapp/kandan/commit/1de14a0) proper padding on message bottom __(Kev Zettler)__
 * [07ae0c2](http://github.com/kandanapp/kandan/commit/07ae0c2) new tab styles __(Kev Zettler)__
 * [44a8e7f](http://github.com/kandanapp/kandan/commit/44a8e7f) ui tweaks to header __(Kev Zettler)__
 * [a2a5ebc](http://github.com/kandanapp/kandan/commit/a2a5ebc) "fixing create and delete functionality again... " __(Kev Zettler)__
 * [579a559](http://github.com/kandanapp/kandan/commit/579a559) Removes the 'concerns' section from the readme. It's not relevant anymore __(Akash Manohar J)__
 * [41670e7](http://github.com/kandanapp/kandan/commit/41670e7) Force a user active when added via a hook __(Akash Manohar J)__
 * [360f6c3](http://github.com/kandanapp/kandan/commit/360f6c3) Destroy the activities and attachments if the channel is destroyed __(Akash Manohar J)__
 * [96f7d77](http://github.com/kandanapp/kandan/commit/96f7d77) Fixes to update user on the fly __(Akash Manohar J)__
 * [4d5cfa7](http://github.com/kandanapp/kandan/commit/4d5cfa7) Enables user observer __(Akash Manohar J)__
 * [b7be7d6](http://github.com/kandanapp/kandan/commit/b7be7d6) Merge branch 'master' of github.com:Bushido/Kandan __(Akash Manohar J)__
 * [3cda94b](http://github.com/kandanapp/kandan/commit/3cda94b) Adds Bushido initializer __(Akash Manohar J)__
 * [12cd906](http://github.com/kandanapp/kandan/commit/12cd906) fixes create tab. fixes logout menu scrolling bug __(Kev Zettler)__
 * [6343d95](http://github.com/kandanapp/kandan/commit/6343d95) Adds notification in the windoe title if the window/tab is inactive __(Akash Manohar J)__
 * [0cc5d17](http://github.com/kandanapp/kandan/commit/0cc5d17) Displays links in file upload notifications __(Akash Manohar J)__
 * [d3f89ba](http://github.com/kandanapp/kandan/commit/d3f89ba) Saves locale on bushido login __(Akash Manohar J)__
 * [a74e794](http://github.com/kandanapp/kandan/commit/a74e794) Fixes pagination; Works again; Also respects pagination setting in the kandan settings file __(Akash Manohar J)__
 * [285d2f2](http://github.com/kandanapp/kandan/commit/285d2f2) Fixes typo in Gemfile __(Akash Manohar J)__
 * [109eda1](http://github.com/kandanapp/kandan/commit/109eda1) Fixes, Fixes and Fixes. And then merges 'master' into 'tweaks' __(Akash Manohar J)__
 * [7fc3f7a](http://github.com/kandanapp/kandan/commit/7fc3f7a) logout positioning __(Kev Zettler)__
 * [3bdc720](http://github.com/kandanapp/kandan/commit/3bdc720) live events for delete and create channel __(Kev Zettler)__
 * [b6c3098](http://github.com/kandanapp/kandan/commit/b6c3098) scroll fix wiht a mask __(Kev Zettler)__
 * [241a1b0](http://github.com/kandanapp/kandan/commit/241a1b0) proper border on right __(Kev Zettler)__
 * [876fad7](http://github.com/kandanapp/kandan/commit/876fad7) create tabs work now __(Kev Zettler)__
 * [2ee81a5](http://github.com/kandanapp/kandan/commit/2ee81a5) adde channels seems ok, need fix for the button __(Kev Zettler)__
 * [3726429](http://github.com/kandanapp/kandan/commit/3726429) deletes appear to be restored __(Kev Zettler)__
 * [f2f81e2](http://github.com/kandanapp/kandan/commit/f2f81e2) partial delete __(Kev Zettler)__
 * [d6da3f0](http://github.com/kandanapp/kandan/commit/d6da3f0) proper event attachment for close and create channels __(Kev Zettler)__
 * [bf78300](http://github.com/kandanapp/kandan/commit/bf78300) scrolling back in action __(Kev Zettler)__
 * [8f2e6cc](http://github.com/kandanapp/kandan/commit/8f2e6cc) duplicate template sync __(Kev Zettler)__
 * [b53f704](http://github.com/kandanapp/kandan/commit/b53f704) chatbox styles and tabs and scrolling __(Kev Zettler)__
 * [c5de3c7](http://github.com/kandanapp/kandan/commit/c5de3c7) Fixes channel creation and deletion __(Akash Manohar J)__
 * [e99d32b](http://github.com/kandanapp/kandan/commit/e99d32b) Merge branch 'master' of github.com:Bushido/Kandan into tweaks __(Akash Manohar J)__
 * [4491468](http://github.com/kandanapp/kandan/commit/4491468) Fixes channel deletion __(Akash Manohar J)__
 * [8f68065](http://github.com/kandanapp/kandan/commit/8f68065) moved tabs in to actual header markup as they should be. working on scrolling form browser window and not inner divs __(Kev Zettler)__
 * [81a6faf](http://github.com/kandanapp/kandan/commit/81a6faf) Minor fixes and also removes some logging __(Akash Manohar J)__
 * [7d77d15](http://github.com/kandanapp/kandan/commit/7d77d15) disable user instead of deleting __(Akash Manohar J)__
 * [ff36e73](http://github.com/kandanapp/kandan/commit/ff36e73) Adds Bushido bootstrap and hooks. Readies the app for non-Bushido platforms. __(Akash Manohar J)__
 * [a6ed5c7](http://github.com/kandanapp/kandan/commit/a6ed5c7) Event fixes __(Akash Manohar J)__
 * [6a23273](http://github.com/kandanapp/kandan/commit/6a23273) logout menu __(Kev Zettler)__
 * [c54db0f](http://github.com/kandanapp/kandan/commit/c54db0f) upload message tab position __(Kev Zettler)__
 * [e03ba33](http://github.com/kandanapp/kandan/commit/e03ba33) more header detail finagling __(Kev Zettler)__
 * [601e4e8](http://github.com/kandanapp/kandan/commit/601e4e8) highlight details on header __(Kev Zettler)__
 * [a94ce20](http://github.com/kandanapp/kandan/commit/a94ce20) tabs and header padding __(Kev Zettler)__
 * [3130e21](http://github.com/kandanapp/kandan/commit/3130e21) base header padding __(Kev Zettler)__
 * [a530c6a](http://github.com/kandanapp/kandan/commit/a530c6a) icons for widgets more rendering bugs __(Kev Zettler)__
 * [e55ca68](http://github.com/kandanapp/kandan/commit/e55ca68) tab fix __(Kev Zettler)__
 * [3f92f32](http://github.com/kandanapp/kandan/commit/3f92f32) Merge branch 'master' of github.com:Bushido/Kandan __(Kev Zettler)__
 * [ed2bbb2](http://github.com/kandanapp/kandan/commit/ed2bbb2) tab styling __(Kev Zettler)__
 * [2d34402](http://github.com/kandanapp/kandan/commit/2d34402) Adds and uses page background image __(Akash Manohar J)__
 * [d55b1f4](http://github.com/kandanapp/kandan/commit/d55b1f4) Merge branch 'master' of github.com:Bushido/Kandan into tweaks __(Akash Manohar J)__
 * [76bfa9e](http://github.com/kandanapp/kandan/commit/76bfa9e) Adds search icon; fixes file list icon height; fixes header html; fixes attachments regex __(Akash Manohar J)__
 * [ab4e6de](http://github.com/kandanapp/kandan/commit/ab4e6de) removed tane for production __(Kev Zettler)__
 * [60150e2](http://github.com/kandanapp/kandan/commit/60150e2) Specs for API and channels __(Akash Manohar J)__
 * [789bbe7](http://github.com/kandanapp/kandan/commit/789bbe7) Merge branch 'ui_work' into tweaks __(Akash Manohar J)__
 * [23a4e82](http://github.com/kandanapp/kandan/commit/23a4e82) Merge branch 'master' into ui_refactor __(Kev Zettler)__
 * [322f6ec](http://github.com/kandanapp/kandan/commit/322f6ec) Merge branch 'master' into ui_work __(Akash Manohar J)__
 * [ce28aef](http://github.com/kandanapp/kandan/commit/ce28aef) Sets gravatar hash and sets current user __(Akash Manohar J)__
 * [6d5d379](http://github.com/kandanapp/kandan/commit/6d5d379) Bump _bushido-faye __(Sean Grove)__
 * [85dc626](http://github.com/kandanapp/kandan/commit/85dc626) ui sclaing refactoring __(vagrant)__
 * [d479cda](http://github.com/kandanapp/kandan/commit/d479cda) Use new _bushido-faye gem as possible fix for http 1.1 protocol spec compliance __(Sean Grove)__
 * [cb46ef6](http://github.com/kandanapp/kandan/commit/cb46ef6) converted to sass, cleaned up some avatar extra markup __(Kev Zettler)__
 * [d511cab](http://github.com/kandanapp/kandan/commit/d511cab) Merge branch 'master' of github.com:Bushido/Kandan __(Sean Grove)__
 * [f945c2f](http://github.com/kandanapp/kandan/commit/f945c2f) Merge branch 'ui_work' of github.com:Bushido/Kandan into ui_work __(Kev Zettler)__
 * [41b02b8](http://github.com/kandanapp/kandan/commit/41b02b8) Adds logo __(Akash Manohar J)__
 * [6001c75](http://github.com/kandanapp/kandan/commit/6001c75) Merge branch 'ui_work' __(Akash Manohar J)__
 * [3ef9119](http://github.com/kandanapp/kandan/commit/3ef9119) Icons for attachments __(Akash Manohar J)__
 * [231daf1](http://github.com/kandanapp/kandan/commit/231daf1) Merge branch 'ui_work' __(Akash Manohar J)__
 * [e20fa90](http://github.com/kandanapp/kandan/commit/e20fa90) Changes to style to suit new layout __(Akash Manohar J)__
 * [7c4ceb8](http://github.com/kandanapp/kandan/commit/7c4ceb8) Merge branch 'ui_work' __(Akash Manohar J)__
 * [4fd18f9](http://github.com/kandanapp/kandan/commit/4fd18f9) Styles the chatarea with the new layout __(Akash Manohar J)__
 * [6137b77](http://github.com/kandanapp/kandan/commit/6137b77) Adds per-channel chatbox __(Akash Manohar J)__
 * [f981ecb](http://github.com/kandanapp/kandan/commit/f981ecb) Splits styles into different files __(Akash Manohar J)__
 * [0b7d6be](http://github.com/kandanapp/kandan/commit/0b7d6be) Merge branch 'ui_work' __(Akash Manohar J)__
 * [2927623](http://github.com/kandanapp/kandan/commit/2927623) Aligns chatbox with chatarea __(Akash Manohar J)__
 * [cdb8154](http://github.com/kandanapp/kandan/commit/cdb8154) Adds bushido-faye __(Akash Manohar J)__
 * [cd38a08](http://github.com/kandanapp/kandan/commit/cd38a08) Sets color for search input text __(Akash Manohar J)__
 * [658b867](http://github.com/kandanapp/kandan/commit/658b867) Comments out tane in Gemfile __(Akash Manohar J)__
 * [d7a941b](http://github.com/kandanapp/kandan/commit/d7a941b) Search form works; Basic style for search results page __(Akash Manohar J)__
 * [552f761](http://github.com/kandanapp/kandan/commit/552f761) Styles the file list. WIP __(Akash Manohar J)__
 * [81310a9](http://github.com/kandanapp/kandan/commit/81310a9) File widget update to style dropzone __(Akash Manohar J)__
 * [e13cd8b](http://github.com/kandanapp/kandan/commit/e13cd8b) Fixes drag-drop uploads and changes the width of the activity __(Akash Manohar J)__
 * [82a9542](http://github.com/kandanapp/kandan/commit/82a9542) Adds bushido gravatar as default __(Akash Manohar J)__
 * [b8fd30e](http://github.com/kandanapp/kandan/commit/b8fd30e) Refactors kandan.js; Turns the huge function into bits __(Akash Manohar J)__
 * [19cd88b](http://github.com/kandanapp/kandan/commit/19cd88b) Kandan.js refactor __(Akash Manohar J)__
 * [ccce02a](http://github.com/kandanapp/kandan/commit/ccce02a) Some refactor __(Akash Manohar J)__
 * [1af4e97](http://github.com/kandanapp/kandan/commit/1af4e97) changes create_channel_area to camelcase __(Akash Manohar J)__
 * [5720648](http://github.com/kandanapp/kandan/commit/5720648) Delete create channel view __(Akash Manohar J)__
 * [addd3bf](http://github.com/kandanapp/kandan/commit/addd3bf) Syncs channel deletion __(Akash Manohar J)__
 * [cbb5873](http://github.com/kandanapp/kandan/commit/cbb5873) Merges master and solves conflicts __(Akash Manohar J)__
 * [84ed0d6](http://github.com/kandanapp/kandan/commit/84ed0d6) Removes the added logging and switches some js to camelcase __(Akash Manohar J)__
 * [ef209f7](http://github.com/kandanapp/kandan/commit/ef209f7) Logs all incoming messages in the extension __(Akash Manohar J)__
 * [db8ba43](http://github.com/kandanapp/kandan/commit/db8ba43) Logs every faye message __(Akash Manohar J)__
 * [bb9ec49](http://github.com/kandanapp/kandan/commit/bb9ec49) Merges master and solves conflicts __(Akash Manohar J)__
 * [a8a657c](http://github.com/kandanapp/kandan/commit/a8a657c) Adds .bushido to gitignore __(Akash Manohar J)__
 * [3c918bb](http://github.com/kandanapp/kandan/commit/3c918bb) Deletes .bushido from master branch __(Akash Manohar J)__
 * [9352108](http://github.com/kandanapp/kandan/commit/9352108) Logs all faye incoming messages __(Akash Manohar J)__
 * [c050cc8](http://github.com/kandanapp/kandan/commit/c050cc8) Adds activity flushing and tane __(Akash Manohar J)__
 * [9f41521](http://github.com/kandanapp/kandan/commit/9f41521) Adds .bushido to gitignore __(Akash Manohar J)__
 * [e938f54](http://github.com/kandanapp/kandan/commit/e938f54) Some formatting __(Akash Manohar J)__
 * [cdef471](http://github.com/kandanapp/kandan/commit/cdef471) Comments out all test gems __(Akash Manohar J)__
 * [49384cd](http://github.com/kandanapp/kandan/commit/49384cd) comments out sqlite3 __(Akash Manohar J)__
 * [e250767](http://github.com/kandanapp/kandan/commit/e250767) initialize on precompile set to false __(Akash Manohar J)__
 * [3382ebc](http://github.com/kandanapp/kandan/commit/3382ebc) Adds pg __(Akash Manohar J)__
 * [d7f906c](http://github.com/kandanapp/kandan/commit/d7f906c) uses database authenticatable __(Akash Manohar J)__
 * [04e30ec](http://github.com/kandanapp/kandan/commit/04e30ec) Adds public/assets to gitignore __(Akash Manohar J)__
 * [e354f7e](http://github.com/kandanapp/kandan/commit/e354f7e) Uncomments the STS token option __(Akash Manohar J)__
 * [cfdc916](http://github.com/kandanapp/kandan/commit/cfdc916) Adds position relative to tabs __(Akash Manohar J)__
 * [6b2528b](http://github.com/kandanapp/kandan/commit/6b2528b) Adds logging statement for incoming faye messages __(Akash Manohar J)__
 * [81a35d3](http://github.com/kandanapp/kandan/commit/81a35d3) Merge branch 'ui_work' __(Akash Manohar J)__
 * [8753ea3](http://github.com/kandanapp/kandan/commit/8753ea3) Adds channel deletion; TODO: generate activity to publish deletion __(Akash Manohar J)__
 * [bfe38f6](http://github.com/kandanapp/kandan/commit/bfe38f6) Merge branch 'master' of github.com:Bushido/Kandan __(Akash Manohar J)__
 * [615f75d](http://github.com/kandanapp/kandan/commit/615f75d) Sets default template for tabs for a better kandan __(Akash Manohar J)__
 * [b756870](http://github.com/kandanapp/kandan/commit/b756870) Deletes default template setting for tabs. Lets jquery assume tab template __(Akash Manohar J)__
 * [31df912](http://github.com/kandanapp/kandan/commit/31df912) Uses jquery icon for close. Callback for delete now being called; Channel deletion WIP __(Akash Manohar J)__
 * [ff3d1c4](http://github.com/kandanapp/kandan/commit/ff3d1c4) Adds scrolling, channel add button; Channel deletion WIP __(Akash Manohar J)__
 * [ab401f1](http://github.com/kandanapp/kandan/commit/ab401f1) Updates the Gemfile to be more readable and removes therubyracer __(Sean Grove)__
 * [1e9d8d8](http://github.com/kandanapp/kandan/commit/1e9d8d8) Merge branch 'master' into ui_work2 __(Akash Manohar J)__
 * [f7c579d](http://github.com/kandanapp/kandan/commit/f7c579d) Rewrite of ActiveUsers, Message styling and some refactor of plugins __(Akash Manohar J)__
 * [7032a01](http://github.com/kandanapp/kandan/commit/7032a01) Removes jasmine git dependency. All hopes about a better world is now lost. __(Akash Manohar J)__
 * [e0f0de6](http://github.com/kandanapp/kandan/commit/e0f0de6) Some border tricks to emulate the divider __(Akash Manohar J)__
 * [fa7e9a1](http://github.com/kandanapp/kandan/commit/fa7e9a1) Changes border radius for widgets __(Akash Manohar J)__
 * [b408902](http://github.com/kandanapp/kandan/commit/b408902) Adds gravatar_hash on user creation and specs __(Akash Manohar J)__
 * [06fffb4](http://github.com/kandanapp/kandan/commit/06fffb4) Adds .sass-cache to gitignore __(Akash Manohar J)__
 * [9af7613](http://github.com/kandanapp/kandan/commit/9af7613) Adds bourbon, basic style and fixes to widgets __(Akash Manohar J)__
 * [d14f9eb](http://github.com/kandanapp/kandan/commit/d14f9eb) Channel creation and minor fixes __(Akash Manohar J)__
 * [d5e2f4d](http://github.com/kandanapp/kandan/commit/d5e2f4d) Adds search; Faye callbacks for transport down and up; Some minor refactor to support search __(Akash Manohar J)__
 * [7144978](http://github.com/kandanapp/kandan/commit/7144978) Fixes Channels API: the way it sets active channel id __(Akash Manohar J)__
 * [d5bed59](http://github.com/kandanapp/kandan/commit/d5bed59) Changes chatbox to a textarea and adds the pastie plugin __(Akash Manohar J)__
 * [1068a2b](http://github.com/kandanapp/kandan/commit/1068a2b) Specs for models and channels controller __(Akash Manohar J)__
 * [99ca945](http://github.com/kandanapp/kandan/commit/99ca945) uncomments STS token option __(Akash Manohar J)__
 * [bd32246](http://github.com/kandanapp/kandan/commit/bd32246) Adds a per-channel file list __(Akash Manohar J)__
 * [91af3b6](http://github.com/kandanapp/kandan/commit/91af3b6) Adds channel data API, upload notifications  and some fixes __(Akash Manohar J)__
 * [d835083](http://github.com/kandanapp/kandan/commit/d835083) adds basic file upload widget, dependencies and resources for attachments __(Akash Manohar J)__
 * [6f7ad84](http://github.com/kandanapp/kandan/commit/6f7ad84) deletes views,templates that are not used __(Akash Manohar J)__
 * [6ebd6cd](http://github.com/kandanapp/kandan/commit/6ebd6cd) Adds pagination; after a lot of 'vada poche' moments __(Akash Manohar J)__
 * [6ab6f30](http://github.com/kandanapp/kandan/commit/6ab6f30) Merges link, youtube and image modifiers into one plugin __(Akash Manohar J)__
 * [7848019](http://github.com/kandanapp/kandan/commit/7848019) Fixes embed plugins and history formatting __(Akash Manohar J)__
 * [1c64ec5](http://github.com/kandanapp/kandan/commit/1c64ec5) Adds a few plugins and fixes __(Akash Manohar J)__
 * [75afafb](http://github.com/kandanapp/kandan/commit/75afafb) Adds improvements and plugins __(Akash Manohar J)__
 * [cbb4f4f](http://github.com/kandanapp/kandan/commit/cbb4f4f) Changes APIs to fix active users. Listen to unsubscribe instead of disconnect event. Changes user list to new APIs __(Akash Manohar J)__
 * [a68466e](http://github.com/kandanapp/kandan/commit/a68466e) Fixes channel message rendering __(Akash Manohar J)__
 * [42c1b9b](http://github.com/kandanapp/kandan/commit/42c1b9b) Adds basic+buggy user list __(Akash Manohar J)__
 * [93e89e2](http://github.com/kandanapp/kandan/commit/93e89e2) Removes a console.log line __(Akash Manohar J)__
 * [9d521c3](http://github.com/kandanapp/kandan/commit/9d521c3) Adds perfectly working 007-style user spying __(Akash Manohar J)__
 * [ec9b415](http://github.com/kandanapp/kandan/commit/ec9b415) Adds user notifications, basic Kandan.Data APIs and some other re-organization __(Akash Manohar J)__
 * [4472358](http://github.com/kandanapp/kandan/commit/4472358) Moves fetching current user to a helper __(Akash Manohar J)__
 * [8b48262](http://github.com/kandanapp/kandan/commit/8b48262) Adds helper methods and appends new activities to the chat area __(Akash Manohar J)__
 * [1b9fc13](http://github.com/kandanapp/kandan/commit/1b9fc13) Simplifies identifying current channel __(Akash Manohar J)__
 * [2ed6093](http://github.com/kandanapp/kandan/commit/2ed6093) Working chat app with jQuery tabs and Backbone. Adds a small chat posting box __(Akash Manohar J)__
 * [6d0f370](http://github.com/kandanapp/kandan/commit/6d0f370) Switches the whole app to backbone. Oolaa __(Akash Manohar J)__
 * [f87789a](http://github.com/kandanapp/kandan/commit/f87789a) Adds working views __(Akash Manohar J)__
 * [3698cc0](http://github.com/kandanapp/kandan/commit/3698cc0) Lists channels and activities on the index page __(Akash Manohar J)__
 * [4125ff0](http://github.com/kandanapp/kandan/commit/4125ff0) Basic app to list created channels __(Akash Manohar J)__
 * [9a2a2e7](http://github.com/kandanapp/kandan/commit/9a2a2e7) Organises the app with libraries and settings __(Akash Manohar J)__
 * [064341d](http://github.com/kandanapp/kandan/commit/064341d) Adds thin and sets up Faye in config.ru __(Akash Manohar J)__
 * [0c7890d](http://github.com/kandanapp/kandan/commit/0c7890d) Adds ember tree; Main controller with index action; Sets main#index as root __(Akash Manohar J)__
 * [4ecb0e4](http://github.com/kandanapp/kandan/commit/4ecb0e4) Adds ember tree; Main controller with index action; ember-rails as dependency from git source __(Akash Manohar J)__
 * [5b3bb04](http://github.com/kandanapp/kandan/commit/5b3bb04) Adds a README.md __(Akash Manohar J)__
 * [7f51891](http://github.com/kandanapp/kandan/commit/7f51891) Removes ember-rails __(Akash Manohar J)__
 * [8e26912](http://github.com/kandanapp/kandan/commit/8e26912) Jasmine install; Devise initializer; Models and model specs __(Akash Manohar J)__
 * [f7265e9](http://github.com/kandanapp/kandan/commit/f7265e9) Initial commit with dependencies and dev tools setup along with a devise User model __(Akash Manohar J)__