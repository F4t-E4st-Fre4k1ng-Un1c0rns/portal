interface FetchingModule {
  fetchData: Function
}

interface AuthModule {
  register: Function
  login: Function
  getUser: Function
}

export { type AuthModule, type FetchingModule }
