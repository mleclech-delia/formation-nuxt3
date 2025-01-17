<script lang="ts" setup>
interface User {
  name: string
  role: string
}

const isPendingSignOut = ref(false)

const { fetch, clear } = useUserSession()
const user = useUserSession().user as unknown as User

async function logout() {
  isPendingSignOut.value = true
  await clear()
  isPendingSignOut.value = false
  navigateTo('/login')
}
onMounted(() => {
  fetch()
})
</script>

<template>
  <DropdownMenu v-if="user">
    <DropdownMenuTrigger as-child>
      <Avatar>
        <AvatarImage
          :src="`https://api.dicebear.com/9.x/personas/svg?seed=${user.name}`"
          alt="Avatar"
        />
        <AvatarFallback>U</AvatarFallback>
      </Avatar>
    </DropdownMenuTrigger>
    <DropdownMenuContent>
      <DropdownMenuLabel>{{ user.name }}</DropdownMenuLabel>
      <DropdownMenuLabel>
        @{{ user.role }}
      </DropdownMenuLabel>
      <DropdownMenuSeparator />
      <DropdownMenuItem>
        <Button
          variant="ghost"
          :disabled="isPendingSignOut"
          class="w-full"
          @click="logout"
        >
          <Icon
            v-if="isPendingSignOut"
            name="heroicons:arrow-path"
            class="w-4 h-4 mr-2 animate-spin"
          />
          Se déconnecter
        </Button>
      </DropdownMenuItem>
    </DropdownMenuContent>
  </DropdownMenu>
</template>
