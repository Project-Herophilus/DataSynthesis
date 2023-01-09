const url = process.env.NODE_ENV ===  "production" ? "/" : "http://localhost:8001"
export default {
  base_url: url
};