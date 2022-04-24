import SideBar from "./components/SidebarPlugin";

// asset imports
import VueMaterial from "vue-material";
import "vue-material/dist/vue-material.css";
import "./assets/scss/material-dashboard.scss";


/**
 * This is the main Light Bootstrap Dashboard Vue plugin where dashboard related plugins are registerd.
 */
export default {
  install(Vue) {
    Vue.use(SideBar);
    Vue.use(VueMaterial);
  },
};