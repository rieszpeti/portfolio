<script lang="ts">
	import { fade } from "svelte/transition";

    interface MainButton {
      name: string;
      href: string;
    }

    const email = import.meta.env.VITE_MY_EMAIL;
    const cv = import.meta.env.VITE_CV_LINK

    const buttons: MainButton[] = [
        { name: 'About', href: '/About' },
        { name: 'Email', href: email },
        { name: 'CV', href: cv }
    ];

    let isShowEmailMessage = false;
    let emailMessage = '';

    const copyEmail = () => {
        navigator.clipboard.writeText(email)
            .then(() => {
                emailMessage = "Email copied";
                isShowEmailMessage = true;
                setTimeout(() => isShowEmailMessage = false, 5000);
            })
            .catch(err => {
                emailMessage = 'Oops, something went wrong while copying the email. Please try again later.';
                isShowEmailMessage = true;
                if (import.meta.env.MODE === 'development') {
                    console.error('Failed to copy email: ', err);
                }
            });
    };

</script>

<h1 class="text-2xl mt-4 max-sm:flex max-sm:flex-col max-sm:items-center max-sm:justify-center">
    Hey, I'm Peter,<br>
    <span class="block mt-2">A Backend software engineer.</span>
</h1>

<span class="block mt-2 font-color max-sm:flex max-sm:flex-col max-sm:items-center max-sm:justify-center">
    Experienced in building reliable, scalable systems and web applications. 
    Focused on creating efficient solutions while exploring new technologies 
    to improve workflows and processes.
</span>

<div class="flex flex-wrap gap-4 mt-4 max-sm:flex-col max-sm:items-center max-sm:space-y-2">
    {#each buttons as { name, href }}
        <button 
            class="rounded w-28 py-2 button-bg-color text-white hover:bg-gray-600 max-sm:w-40"
            on:click={() => { 
                if (name === 'Email') {
                    copyEmail();
                } else {
                    window.location.href = href;
                }
            }}
        >
            {name}
        </button>
    {/each}
</div>

{#if isShowEmailMessage}
  <div class="notification fixed top-0 right-0 m-4 button-bg-color text-white p-4 rounded shadow-md flex items-center z-50"
    in:fade
    out:fade>
    <p class="mr-4">{emailMessage}</p>
    <button on:click={() => isShowEmailMessage = false} class="text-white text-xl">&times;</button>
  </div>
{/if}

<style>
    .button-bg-color {
        background-color: #2b2b2b;
    }
</style>
