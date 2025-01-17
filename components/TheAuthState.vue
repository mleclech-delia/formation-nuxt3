<script lang="ts" setup>
onMounted(() => {
  useUserSession().fetch()
})
</script>

<template>
  <header class="flex items-center justify-end p-4">
    <AuthState>
      <template #default="{ loggedIn }">
        <TheAvatar v-if="loggedIn" />
        <NuxtLink v-else to="/login">
          Se connecter
        </NuxtLink>
      </template>
      <template #placeholder>
        <button disabled>
          Loading...
        </button>
      </template>
    </AuthState>
  </header>
</template>
