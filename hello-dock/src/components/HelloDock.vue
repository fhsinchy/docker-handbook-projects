<template>
  <h1>{{ msg }}</h1>
  <p>An in-depth guide to application containerization with <a href="https://www.docker.com/" target="_blank">Docker</a></p>
  <hr>
  <p>
    <strong>Author:</strong> <a href="https://www.freecodecamp.org/news/author/farhanhasin/" target="_blank">Farhan Hasin Chowdhury</a>
    <br>
    <strong>Website:</strong> <a href="https://www.farhan.info/" target="_blank">https://farhan.info/</a>
    <br>
    <strong>LinkedIn:</strong> <a href="https://www.linkedin.com/in/farhanhasin/" target="_blank">/in/farhanhasin</a>
    <br>
    <strong>Twitter:</strong> <a href="https://twitter.com/frhnhsin" target="_blank">@frhnhsin</a>
  </p>
</template>

<script>
export default {
  name: 'HelloDock',
  props: {
    msg: String
  },
}
</script>
