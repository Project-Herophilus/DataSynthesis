
import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App";
import vuetify from '@/plugins/vuetify' // path to vuetify export
// router setup
import routes from "./routes/routes";

// Plugins
import GlobalComponents from "./globalComponents";
import GlobalDirectives from "./globalDirectives";
import Notifications from "./components/NotificationPlugin";

// MaterialDashboard plugin
import MaterialDashboard from "./material-dashboard";

import Chartist from "chartist";

// configure router
const router = new VueRouter({
  routes, // short for routes: routes
  linkExactActiveClass: "nav-item active",
});

Vue.prototype.$Chartist = Chartist;

Vue.use(VueRouter);
Vue.use(MaterialDashboard);
Vue.use(GlobalComponents);
Vue.use(GlobalDirectives);
Vue.use(Notifications);
/* eslint-disable no-new */
new Vue({
  el: "#app",
  render: (h) => h(App),
  router,
  vuetify,
  data: {
    Chartist: Chartist,
  },
});
