Kandan
=========

A Bushido chat application



Concerns
=========

* When a user is removed from the Bushido group, the user record should only be marked as disabled. So that all chat history is still relevant (not out of context).
  Authorizing a user to an app is taken care of by the Bushido authorizer so there's no security hole (being able to login when the record is present).