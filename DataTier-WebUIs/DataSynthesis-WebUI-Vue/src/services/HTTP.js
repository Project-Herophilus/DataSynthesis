import axios from "axios";
import api from "@/configs/api.js";

export default () => {
  return axios.create({
    baseURL: api["base_url"],
    withCredentials: false,
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    }
  });
};