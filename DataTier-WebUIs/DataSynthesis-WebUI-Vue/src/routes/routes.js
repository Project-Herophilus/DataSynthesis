import DashboardLayout from "@/pages/Layout/DashboardLayout.vue";

import Dashboard from "@/pages/Dashboard.vue";
import UserProfile from "@/pages/UserProfile.vue";
import PlatformAdmin from "@/pages/PlatformAdmin.vue";

const routes = [
  {
    path: "/",
    component: DashboardLayout,
    redirect: "/datamanagement",
    children: [
      {
        path: "user",
        name: "User Profile",
        component: UserProfile,
      },
      {
        path: "datamanagement",
        name: "Table List",
        component: Dashboard,
      },
      {
        path: "platformadmin",
        name: "Platform Admin",
        component: PlatformAdmin
      },
    ],
  },
];

export default routes;
