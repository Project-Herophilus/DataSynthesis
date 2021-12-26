//https://infinispan.org/docs/hotrod-clients/js/latest/js_client.html

var infinispan = require('infinispan');

var connected = infinispan.client([{port: 11322, host: '127.0.0.1'}, {port: 11222, host: '127.0.0.1'}], {
    // Configure client connections with authentication and encryption here.
});

var connectedSAML = infinispan.client(
    {port: 11222, host: '127.0.0.1'},
    {
        authentication: {
            enabled: true,
            saslMechanism: 'DIGEST-MD5',
            userName: 'username',
            password: 'changeme',
            serverName: 'infinispan'
        }
    }
);

var connectedOAuth = infinispan.client(
    {port: 11222, host: '127.0.0.1'},
    {
        authentication: {
            enabled: true,
            saslMechanism: 'OAUTHBEARER',
            token: `<token>`
        }
    }
);

connected.then(function (client) {

    var members = client.getTopologyInfo().getMembers();

    // Displays all members of the Infinispan cluster.
    console.log('Connected to: ' + JSON.stringify(members));

    return client.disconnect();

}).catch(function(error) {

    console.log("Got error: " + error.message);

});