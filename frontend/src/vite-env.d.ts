/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_MOCKING: boolean
  readonly VITE_EVENTS_BASE_API: string
  readonly VITE_AUTH_BASE_API: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
