<script lang="ts">
	import ShowCopySuccess from "./ShowCopySuccess.svelte";

    interface MainButton {
      name: string;
      href: string;
    }

    const email = "peter.riesz.developer@gmail.com";

    const buttons: MainButton[] = [
        { name: 'About', href: "#about" },
        { name: 'Email', href: email },
        { name: 'CV', href: "https://drive.google.com/file/d/1SXZ65dmnlDYuTZexWJgjaAzdhs5nxt_d/view?usp=sharing" }
    ];

    let isShowEmailMessage = false;
    let emailMessage = '';

    const copyEmail = () => {
        if (!navigator.clipboard) {
            emailMessage = `Copy manually, because clipboard is not available: ${email}`;
            isShowEmailMessage = true;
            setTimeout(() => isShowEmailMessage = false, 7000);
        } else {
            (navigator.clipboard as Clipboard).writeText(email)
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
        }
    };


</script>


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

<ShowCopySuccess {isShowEmailMessage} {emailMessage} />