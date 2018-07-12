/* global Vue, VueRouter, axios */

// var HomePage = {
//   template: "#home-page",
//   data: function() {
//     return {
//       message: "Welcome to Vue.js!"
//     };
//   },
//   created: function() {},
//   methods: {},
//   computed: {}
// };

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var MeetupIndexPage = {
  template: "#meetups-index-page",
  data: function() {
    return {
          meetups: []
    };
  },
  created: function() {
    axios
    .get("/api/meetups/")
    .then(function(response) {
      this.meetups = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var MeetupNewPage = {
  template: "#meetups-new-page",
  data: function() {
    return {
      name: "",
      start_time: "",
      end_time: "",
      description: ""
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        start_time: this.start_time,
        end_time: this.end_time,
        description: this.description,
      };
      axios
        .post("/api/meetups", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var MeetupShowPage = {
  template: "#meetups-show-page",
  data: function() {
    return {
          meetup: {
                    id: "",
                    name: "",
                    start_time: "",
                    end_time: "",
                    description: ""
          }

    };
  },
  created: function() {
    axios
    .get("/api/meetups/" + this.$route.params.id)
    .then(function(response) {
      this.meetup = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var MeetupEditPage = {
  template: "#meetups-show-page",
  data: function() {
    return {
          meetup: {
                    id: "",
                    name: "",
                    start_time: "",
                    end_time: "",
                    description: ""
          }

    };
  },
  created: function() {
    axios
    .get("/api/meetups/" + this.$route.params.id)
    .then(function(response) {
      this.meetup = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var EventIndexPage = {
  template: "#events-index-page",
  data: function() {
    return {
          events: []
    };
  },
  created: function() {
    axios
    .get("/api/events/")
    .then(function(response) {
      this.events = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var EventNewPage = {
  template: "#events-new-page",
  data: function() {
    return {
      name: "",
      location: "",
      description: ""
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        location: this.location,
        description: this.description
      };
      axios
        .post("/api/events", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var EventShowPage = {
  template: "#events-show-page",
  data: function() {
    return {
          event: {
                    id: "",
                    name: "",
                    location: "",
                    description: ""
          }

    };
  },
  created: function() {
    axios
    .get("/api/events/" + this.$route.params.id)
    .then(function(response) {
      this.event = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var LocationIndexPage = {
  template: "#locations-index-page",
  data: function() {
    return {
          locations: []
    };
  },
  created: function() {
    axios
    .get("/api/locations/")
    .then(function(response) {
      this.locations = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var LocationNewPage = {
  template: "#locations-new-page",
  data: function() {
    return {
      name: "",
      longitude: "",
      latitude: ""
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        longitude: this.longitude,
        latitude: this.latitude
      };
      axios
        .post("/api/locations/", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LocationShowPage = {
  template: "#locations-show-page",
  data: function() {
    return {
          location: {
                    id: "",
                    name: "",
                    longitude: "",
                    latitude: ""
          }

    };
  },
  created: function() {
    axios
    .get("/api/locations/" + this.$route.params.id)
    .then(function(response) {
      console.log(response);
      this.location = response.data;
      console.log("location", this.location);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var UserShowPage = {
  template: "#locations-show-page",
  data: function() {
    return {
          location: {
                    id: "",
                    name: "",
                    longitude: "",
                    latitude: ""
          }

    };
  },
  created: function() {
    axios
    .get("/api/locations/" + this.$route.params.id)
    .then(function(response) {
      console.log(response);
      this.location = response.data;
      console.log("location", this.location);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
            { path: "/", component: MeetupIndexPage },
            { path: "/signup", component: SignupPage },
            { path: "/login", component: LoginPage },
            { path: "/logout", component: LogoutPage },
            { path: "/meetups", component: MeetupIndexPage },
            { path: "/meetups/new", component: MeetupNewPage },
            { path: "/meetups/:id", component: MeetupShowPage },
            { path: "/meetups/:id/edit", component: MeetupEditPage },
            { path: "/events/", component: EventIndexPage },
            { path: "/events/new", component: EventNewPage },
            { path: "/events/:id", component: EventShowPage },
            { path: "/locations", component: LocationIndexPage },
            { path: "/locations/new", component: LocationNewPage },
            { path: "/locations/:id", component: LocationShowPage }
            




            


           ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});


var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});