try {
  process.env.VUE_APP_HA_REFRESH_TOKEN =
    require("/data/options.json").refresh_token;
} catch (e) {}

module.exports = {
  publicPath: "",
  outputDir: "/var/www/html",
};
