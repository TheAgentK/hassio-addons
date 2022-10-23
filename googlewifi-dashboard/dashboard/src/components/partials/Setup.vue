<template>
  <div>
    <h1>Google Wi-Fi: Web Dashboard</h1>
    <p>
      You're going to need a refresh token to view your network.
      <br />
      Click
      <a target="_blank" href="https://www.angelod.com/onhubauthtool/">here</a>
      to get one.
    </p>
    <p v-if="status.state">{{ `${status.state}: ${status.message}` }}</p>
    <div class="form">
      <input v-model="refreshToken" placeholder="refreshToken" />
      <button @click="setup()">submit</button>
    </div>
  </div>
</template>

<style scoped>
.form button {
  padding: 1rem;
  border: 1px solid black;
  border-radius: 0.5rem;
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  cursor: pointer;
}

.form button:active {
  background-color: #fff;
}

.form input {
  padding: 1rem;
  margin: 0;
  border: 0;

  border-radius: 0.5rem;
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
</style>

<script>
import { setupGoogleWifiApi } from "@/lib/googleWifiApi.js";
import { mapGetters } from "vuex";
// import ha_options from "/data/options.json";

export default {
  data() {
    return {
      refreshToken: "",
      status: {
        state: "",
        message: "",
      },
    };
  },
  computed: {
    ...mapGetters(["isLoggedIn"]),
  },
  beforeMount: function () {
    this.homeAssistantSetup();
  },
  methods: {
    async homeAssistantSetup() {
      const refresh_token = process.env.VUE_APP_HA_REFRESH_TOKEN;
      if (refresh_token) {
        this.refreshToken = refresh_token;
        this.setup();
      }
    },
    async setup() {
      try {
        const res = await setupGoogleWifiApi(this.refreshToken);

        if (!res) return;

        this.$store.commit("setLoggedIn", true);
        this.$store.commit("setRefreshToken", this.refreshToken);
        await this.$store.dispatch("setGroup");
        await Promise.all([
          this.$store.dispatch("setDevices"),
          this.$store.dispatch("getSpeedTestResults"),
          this.$store.dispatch("startRealtimeMetrics"),
          this.$store.dispatch("setInsightCards"),
        ]);
      } catch (e) {
        this.status = { state: "error", message: e.message };
      }
    },
  },
};
</script>
