import { z } from 'zod'

const bodySchema = z.object({
  username: z.string(),
  password: z.string(),
})

export default defineEventHandler(async (event) => {
  const { username, password } = await readValidatedBody(event, bodySchema.parse)

  if (username === 'admin' && password === 'admin') {
    // set the user session in the cookie
    // this server util is auto-imported by the auth-utils module
    await setUserSession(event, {
      user: {
        name: 'Admin admin',
        role: 'admin',
      },
    })
    return {}
  }
  if (username === 'user' && password === 'user') {
    // set the user session in the cookie
    // this server util is auto-imported by the auth-utils module
    await setUserSession(event, {
      user: {
        name: 'User user',
        role: 'user',
      },
    })
    return {}
  }
  throw createError({
    statusCode: 401,
    message: 'Bad credentials',
  })
})
