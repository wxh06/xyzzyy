$(document).ready(() => {
  const xyzzyy = new window.Vue({
    el: '#xyzzyy',
    data: {
      // action: '',
      all: undefined,
      error: '',
      exam: undefined,
      exams: [],
      loading: undefined,
      user: '',
      students: undefined,
    },
    mounted() {
      $('.menu .item[data-tab]').tab({
        history: true,
        historyType: 'hash',
      });
      window.axios.get('/data/http/114.118.97.15/site_20180305000000/students/').then((response) => {
        xyzzyy.students = response.data;
        $('.ui.dropdown').dropdown();
      });
    },
    methods: {
      fetch() {
        if (xyzzyy.user) {
          xyzzyy.error = '';
          xyzzyy.loading = true;
          window.axios.get(
            '/data/http/114.118.97.15/site_20180305000000/exams/',
            {
              params: { user: xyzzyy.user, all: xyzzyy.all, exam: xyzzyy.exam },
            },
          ).then((res) => {
            if (
              xyzzyy.user === res.config.params.user
              && xyzzyy.all === res.config.params.all
              && xyzzyy.exam === res.config.params.exam
            ) {
              xyzzyy.exams = res.data;
              xyzzyy.loading = false;
            }
          }).catch((e) => {
            xyzzyy.loading = false;
            xyzzyy.error = e;
          });
        }
      },
    },
  });

  const elp = new window.Vue({
    el: '#elp',
    data: {
      articles: [],
      error: false,
      loading: false,
      password: '',
      username: '',
    },
    methods: {
      fetch() {
        elp.error = false;
        elp.loading = true;
        window.axios.get('/elp/', { params: { username: elp.username, password: elp.password } }).then((response) => {
          elp.articles = response.data;
          elp.loading = false;
        }).catch(() => {
          elp.loading = false;
          elp.error = true;
        });
      },
    },
  });

  const licenses = new window.Vue({
    el: '#licenses',
    data: {
      licenses: [],
    },
    mounted() {
      window.axios.get('/licenses/').then((response) => {
        licenses.licenses = response.data;
      });
    },
  });
});
