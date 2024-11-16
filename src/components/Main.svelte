<script lang="ts">
    import IntroSection from "./IntroSection.svelte";
	import MainButtons from "./MainButtons.svelte";

    import Stack from "./Stack.svelte";
    import Experience from "./Experience.svelte";
    import Projects from "./Projects.svelte";
	import Education from "./Education.svelte";
	import About from "./About.svelte";
</script>

<svelte:head>
	<meta name="description" content="Peter Riesz's portfolio website" />
</svelte:head>

<IntroSection />

<MainButtons />

<Stack />

<Experience />

<Projects />

<Education />

<About />

<style>
    :global(.button-bg-color) {
        background-color: #2b2b2b;
    }
</style>

