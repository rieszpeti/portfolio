<script lang="ts">
    interface MainButton {
      name: string;
      href: string;
    }

    const buttons: MainButton[] = [
    { name: 'About', href: '#' },
    { name: 'Email', href: '#' },
    { name: 'CV', href: import.meta.env.VITE_CV_LINK }
    ];
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
        <button class="rounded w-28 py-2 button-bg-color text-white hover:bg-gray-600 max-sm:w-40">
            <a href={href}>
                {name}
            </a>
        </button>
    {/each}
</div>
  
<style>
    .button-bg-color {
        background-color: #2b2b2b;
    }
</style>
