import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
import config from '../config/environment';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    const headers = {};
    this.get('session').authorize('authorizer:google', (headerName, headerValue) => {
      headers[headerName] = headerValue;
    });
    return Ember.$.ajax(`${config.APP.backendUrl}/api/v1/groups`, { headers });
  }
});
