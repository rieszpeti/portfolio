<script lang="ts">
  import "../app.css";
  import Footer from "../components/Footer.svelte";
	import SideBar from "../components/SideBar.svelte";
</script>

<div class="flex h-screen flex-col md:flex-row">
  <div class="w-full md:w-1/6 hidden md:block">
    <SideBar />
  </div>

  <div class="w-full md:w-5/6 px-4 md:px-8 max-w-screen-xl mx-auto flex flex-col min-h-screen">
    <!-- Main content-->
    <div class="flex-1">
      <slot />
    </div>

    <div class="sticky bottom-0">
      <Footer />
    </div>
  </div>
</div>


