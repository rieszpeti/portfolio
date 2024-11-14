<script lang="ts">
  import "../app.css";
  import Footer from "../components/Footer.svelte";
	import SideBar from "../components/SideBar.svelte";

  export const prerender = true;
</script>

<div class="flex h-screen flex-col md:flex-row">
  <div class="w-full md:w-1/6 hidden md:block component-bg-color max-w-[12rem]">
    <SideBar />
  </div>

  <div class="overflow-auto w-full md:w-5/6 px-4 md:px-8 max-w-screen-xl mx-auto flex flex-col min-h-screen">
    <!-- Main content-->
    <div class="flex-1 mb-6">
      <slot />
    </div>

    <div class="sticky bottom-0 rounded-t-lg component-bg-color font-color">
      <Footer />
    </div>
  </div>
</div>

<style>
  .component-bg-color {
    background-color: #1c1c1c;
  }

  :global .font-color {
    color: #707070;
  }
</style>
