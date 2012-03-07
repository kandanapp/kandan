/**
 Ember-REST.js

 A simple library for RESTful resources in Ember.js

 Copyright (c) 2012 Cerebris Corporation

 Licensed under the MIT license:
   http://www.opensource.org/licenses/mit-license.php
*/

/**
  A model class for RESTful resources

  Extend this class and define the following properties:

  * `resourceUrl` -- the base url of the resource (e.g. '/contacts');
       will append '/id' for individual resources (required)
  * `resourceName` -- the name used to contain the serialized data in this
       object's JSON representation (required only for serialization)
  * `resourceProperties` -- an array of property names to be returned in this
       object's JSON representation (required only for serialization)

  Because `resourceName` and `resourceProperties` are only used for
    serialization, they aren't required for read-only resources.

  You may also wish to override / define the following methods:

  * `serialize()`
  * `serializeProperty(prop)`
  * `deserialize(json)`
  * `deserializeProperty(prop, value)`
  * `validate()`
*/
Ember.Resource = Ember.Object.extend({
  resourceUrl: Ember.required(),

  /**
    Duplicate properties from another resource

    * `source` -- an Ember.Resource object
    * `props` -- the array of properties to be duplicated;
         defaults to `resourceProperties`
  */
  duplicateProperties: function(source, props) {
    var prop;

    if (props === undefined) props = this.resourceProperties;

    for(var i = 0; i < props.length; i++) {
      prop = props[i];
      this.set(prop, source.get(prop));
    }
  },

  /**
    Generate this resource's JSON representation

    Override this or `serializeProperty` to provide custom serialization

    REQUIRED: `resourceProperties` and `resourceName` (see note above)
  */
  serialize: function() {
    var name = this.resourceName,
        props = this.resourceProperties,
        prop,
        ret = {};

    ret[name] = {};
    for(var i = 0; i < props.length; i++) {
      prop = props[i];
      ret[name][prop] = this.serializeProperty(prop);
    }
    return ret;
  },

  /**
    Generate an individual property's JSON representation

    Override to provide custom serialization
  */
  serializeProperty: function(prop) {
    return this.get(prop);
  },

  /**
    Set this resource's properties from JSON

    Override this or `deserializeProperty` to provide custom deserialization
  */
  deserialize: function(json) {
    Ember.beginPropertyChanges(this);
    for(var prop in json) {
      if (json.hasOwnProperty(prop)) this.deserializeProperty(prop, json[prop]);
    }
    Ember.endPropertyChanges(this);
    return this;
  },

  /**
    Set an individual property from its value in JSON

    Override to provide custom serialization
  */
  deserializeProperty: function(prop, value) {
    this.set(prop, value);
  },

  /**
    Load via ajax and deserialize

    REQUIRED: `id`
  */
  findResource: function() {
    var self = this;

    return jQuery.ajax({
      url: this._resourceUrl(),
      dataType: 'json',
      type: 'GET'
    }).done( function(json) {
      self.deserialize(json);
    });
  },

  /**
    Create (if new) or update (if existing) record via ajax

    Will call validate() if defined for this record

    If successful, updates this record's id and other properties
    by calling `deserialize()` with the data returned.

    REQUIRED: `properties` and `name` (see note above)
  */
  saveResource: function() {
    var self = this;

    if (this.validate !== undefined) {
      var error = this.validate();
      if (error) {
        return {
          fail: function(f) { f(error); return this; },
          done: function() { return this; },
          always: function(f) { f(); return this; }
        };
      }
    }

    return jQuery.ajax({
      url: this._resourceUrl(),
      data: this.serialize(),
      dataType: 'json',
      type: (this.isNew() ? 'POST' : 'PUT')
    }).done( function(json) {
      // Update properties
      if (json)
        self.deserialize(json);
    });
  },

  /**
    Delete resource via ajax
  */
  destroyResource: function() {
    return jQuery.ajax({
      url: this._resourceUrl(),
      dataType: 'json',
      type: 'DELETE'
    });
  },

  /**
   Is this a new resource?
  */
  isNew: function() {
    return (this._id() === undefined);
  },

  /**
    @private

    The URL for this resource, based on `resourceUrl` and `id` (which will be
      undefined for new resources).
  */
  _resourceUrl: function() {
    var url = this.resourceUrl,
        id = this._id();

    if (id !== undefined)
      url += '/' + id;

    return url;
  },

  /**
    @private

    The id for this resource.
  */
  _id: function() {
    return this.get('id');
  }
});

/**
  A controller for RESTful resources

  Extend this class and define the following:

  * `resourceType` -- an Ember.Resource class; the class must have a `serialize()` method
       that returns a JSON representation of the object
  * `resourceUrl` -- (optional) the base url of the resource (e.g. '/contacts/active');
       will default to the `resourceUrl` for `resourceType`
*/
Ember.ResourceController = Ember.ArrayController.extend({
  resourceType: Ember.required(),

  /**
    @private
  */
  init: function() {
    this._super();
    this.clearAll();
  },

  /**
    Create and load a single `Ember.Resource` from JSON
  */
  load: function(json) {
    var resource = this.get('resourceType').create().deserialize(json);
    this.pushObject(resource);
  },

  /**
    Create and load `Ember.Resource` objects from a JSON array
  */
  loadAll: function(json) {
    for (var i=0; i < json.length; i++)
      this.load(json[i]);
  },

  /**
    Clear this controller's contents (without deleting remote resources)
  */
  clearAll: function() {
    this.set("content", []);
  },

  /**
    Replace this controller's contents with an ajax call to `url`
  */
  findAll: function() {
    var self = this;

    return jQuery.ajax({
      url: this._resourceUrl(),
      dataType: 'json',
      type: 'GET'
    }).done( function(json) {
      self.clearAll();
      self.loadAll(json);
    });
  },

  /**
    @private

    Base URL for ajax calls

    Will use the `resourceUrl` set for this controller, or if that's missing,
    the `resourceUrl` specified for `resourceType`.
  */
  _resourceUrl: function() {
    if (this.resourceUrl === undefined)
      return this.get('resourceType').prototype.resourceUrl;
    else
      return this.resourceUrl;
  }
});
