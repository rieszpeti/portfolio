<script>
	import { fade } from "svelte/transition";

    /**
	 * @type {boolean}
	 */
    export let isShowEmailMessage;
    export let emailMessage;
</script>

{#if isShowEmailMessage}
  <div class="notification fixed top-0 right-0 m-4 button-bg-color text-white p-4 rounded shadow-md flex items-center z-50"
    in:fade
    out:fade>
    <p class="mr-4">{emailMessage}</p>
    <button on:click={() => isShowEmailMessage = false} class="text-white text-xl">&times;</button>
  </div>
{/if}