/*
 * This file is part of Kandan.
 * https://github.com/kandanapp/kandan
 *
 * Kandan's code and assets are dual-licensed. Kandan is available
 * generally under the AGPL, and also under a custom license via
 * special agreement. See LICENSE for the AGPL terms, and contact us
 * at <admin@kandanapp.com> if you're interested in development of
 * Kandan under a custom license.
 */

/*
This code is adapted from https://github.com/jch/jquery.inputHistory

Copyright (c) 2012, Jerry Cheung All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer. Redistributions
in binary form must reproduce the above copyright notice, this list of
conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
(function() {

    (function($) {
	var InputHistory, normalizeKeyHandler;
	InputHistory = (function() {

	    InputHistory.name = 'InputHistory';

	    function InputHistory(options) {
		this.size = options.size || 50;
		this.record = [];
		this.values = [];
		this.index = 0;
	    }

	    InputHistory.prototype.push = function(message) {
		/* only add to the history if the first item in the
		   history isn't the same */
		if ( message != this.record[0] ) {
		    this.record.unshift(message);
		}
		return this.record.splice(this.size);
	    };

	    InputHistory.prototype.prev = function(val) {
		this.index += 1;
		return this.values[this.index];
	    };

	    InputHistory.prototype.next = function() {
		this.index -= 1;
		return this.values[this.index];
	    };

	    InputHistory.prototype.reset = function() {
		this.index = 0;
		this.values = this.record.slice(0);
		this.values.unshift("");
	    }

	    InputHistory.prototype.hasNext = function() {
		return this.index != 0;
	    }

	    InputHistory.prototype.hasPrev = function() {
		return this.index < this.values.length - 1;
	    }

	    InputHistory.prototype.currentize = function(val) {
		this.values[this.index] = val;
	    }

	    return InputHistory;

	})();
	normalizeKeyHandler = function(raw, elseHandler) {
	    elseHandler || (elseHandler = function(e) {});
	    switch (typeof raw) {
            case 'number':
		return function(e) {
		    return e.keyCode === raw;
		};
            case 'string':
		return function(e) {
		    return "" + e.keyCode === raw;
		};
            case 'function':
		return raw;
            default:
		return elseHandler;
	    }
	};
	return $.fn.inputHistory = function(options) {
	    var history,
            _this = this;
	    options || (options = {});
	    options.data || (options.data = 'inputHistory');
	    options.store = normalizeKeyHandler(options.store, function(e) {
		return e.keyCode === 13 && !e.shiftKey && !e.metaKey && !e.ctrlKey && !e.altKey;
	    });
	    options.prev = normalizeKeyHandler(options.prev, function(e) {
		return (e.keyCode === 38 && e.altKey) || (e.ctrlKey && e.keyCode === 80);
	    });
	    options.next = normalizeKeyHandler(options.next, function(e) {
		return (e.keyCode === 40 && e.altKey) || (e.ctrlKey && e.keyCode === 78);
	    });
	    options.reset = normalizeKeyHandler(options.reset, function(e) {
		return e.keyCode === 27;
	    });
	    history = this.data(options.data) || new InputHistory(options);
	    this.data(options.data, history);
	    this.bind('keydown', function(e) {
		history.currentize(_this.val());
		if (options.store(e) && _this.val() != '') {
		    history.push(_this.val());
		    history.reset();
		} else if (options.prev(e)) {
		    if (history.hasPrev()) {
			_this.val(history.prev());
		    }
		    e.preventDefault();
		} else if (options.next(e)) {
		    if (history.hasNext()) {
			_this.val(history.next())
		    }
		    e.preventDefault();
		} else if (options.reset(e)) {
		    _this.val("");
		    history.reset();
		    e.preventDefault();
		}
	    });
	    return this;
	};
    })(jQuery);

}).call(this);
