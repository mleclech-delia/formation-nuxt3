// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },
  modules: [
    '@nuxt/eslint',
    'nuxt-auth-utils',
    '@nuxtjs/tailwindcss',
    'shadcn-nuxt',
    '@nuxtjs/color-mode',
  ],
  eslint: {
    config: {
      standalone: false,
    },
  },
  runtimeConfig: {
    databaseUrl: 'postgres://delia:password@localhost:5432/formation-nuxt3',
  },
})