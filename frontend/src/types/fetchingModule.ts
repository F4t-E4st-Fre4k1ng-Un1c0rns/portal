interface FetchingModule {
  fetchData: Function
}

interface AuthModule {
  register: Function
  login: Function
}

export { type AuthModule, type FetchingModule }
