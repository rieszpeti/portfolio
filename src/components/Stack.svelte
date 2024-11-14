<script lang="ts">
    import type { Component } from 'svelte';
	import type { SVGAttributes } from 'svelte/elements';

    import DeviconBlazor from '~icons/devicon/blazor';
    import SkillIconsDotnet from '~icons/skill-icons/dotnet';
    import DeviconPythonWordmark from '~icons/devicon/python-wordmark';
    import SkillIconsGitlabLight from '~icons/skill-icons/gitlab-light';
    import DeviconPytorch from '~icons/devicon/pytorch';
    import DeviconSvelte from '~icons/devicon/svelte';
    import SkillIconsDocker from '~icons/skill-icons/docker';
    import DeviconPlainAzure from '~icons/devicon-plain/azure';
    import SkillIconsTypescript from '~icons/skill-icons/typescript';
    import DeviconHtml5 from '~icons/devicon/html5';
    import SkillIconsCss from '~icons/skill-icons/css';
    import LineiconsTailwindcss from '~icons/lineicons/tailwindcss';
    import SimpleIconsIconify from '~icons/simple-icons/iconify';
    import DeviconPostgresql from '~icons/devicon/postgresql';
    import DeviconMongodb from '~icons/devicon/mongodb';
    import TablerSql from '~icons/tabler/sql';
    import DeviconFastapi from '~icons/devicon/fastapi';
    import SimpleIconsHuggingface from '~icons/simple-icons/huggingface';
    import DeviconRedis from '~icons/devicon/redis';
    import EosIconsApiOutlined from '~icons/eos-icons/api-outlined';
    import DeviconGit from '~icons/devicon/git';
    import MdiGithub from '~icons/mdi/github';
    import CodiconAzureDevops from '~icons/codicon/azure-devops';
    import DeviconMatlab from '~icons/devicon/matlab';

    interface StackItem {
      name: string;
      icon: Component<SVGAttributes<SVGSVGElement>>;
      style?: string;
    }

    const stackList: StackItem[] = [
        { name: '.NET', icon: SkillIconsDotnet },
        { name: 'Blazor', icon: DeviconBlazor },
        { name: 'Azure', icon: DeviconPlainAzure },
        { name: 'DevOps', icon: CodiconAzureDevops},
        { name: 'Docker', icon: SkillIconsDocker},
        { name: 'Git', icon: DeviconGit },
        { name: 'GitLab', icon: SkillIconsGitlabLight },
        { name: 'GitHub', icon: MdiGithub },
        { name: 'Python', icon: DeviconPythonWordmark },
        { name: 'PyTorch', icon: DeviconPytorch },
        { name: 'FastAPI', icon: DeviconFastapi },
        { name: 'Hugging Face', icon: SimpleIconsHuggingface, style: 'text-yellow-500 border-yellow-500' },
        { name: 'Typescipt', icon: SkillIconsTypescript },
        { name: 'HTML5', icon: DeviconHtml5 },
        { name: 'CSS', icon: SkillIconsCss },
        { name: 'TailwindCSS', icon: LineiconsTailwindcss },
        { name: 'Svelte', icon: DeviconSvelte },
        { name: 'Iconify', icon: SimpleIconsIconify, style: 'text-blue-500' },
        { name: 'WebAPI', icon: EosIconsApiOutlined, style: 'text-green-500' },
        { name: 'PostgreSQL', icon: DeviconPostgresql },
        { name: 'MongoDB', icon: DeviconMongodb },
        { name: 'Redis', icon: DeviconRedis },
        { name: 'MSSQL', icon: TablerSql },
        { name: 'Matlab', icon: DeviconMatlab },
    ];

    function orderByMatrix<T>(items: T[], rows: number, columns: number): T[][][] {
        const matrices: T[][][] = [];
        let matrix: T[][] = Array.from({ length: rows }, () => []);
        
        let rowIndex = 0;
        let colIndex = 0;

        for (const item of items) {
            matrix[rowIndex][colIndex] = item;
            colIndex++;

            if (colIndex === columns) {
                colIndex = 0;
                rowIndex++;
            }

            if (rowIndex === rows) {
                matrices.push(matrix);
                matrix = Array.from({ length: rows }, () => []); // Reset matrix
                rowIndex = 0;
            }
            }

            if (matrix.some(row => row.length > 0)) {
                matrices.push(matrix);
            }

        return matrices;
    }

    const rows = 4;
    const columns = 2;

    const stackMatrix = orderByMatrix(stackList, rows, columns);

    const matrixLength = stackMatrix.length;

    var matrixIdx = 0;

    // svelte-ignore reactive_declaration_non_reactive_property
    $: matrix = stackMatrix[matrixIdx];

    const slideDirection = {
        Previous: 'Previous',
        Next: 'Next',
    } as const;

    type SlideDirection = typeof slideDirection[keyof typeof slideDirection];

    function slideHandler(direction: SlideDirection): void {
        if (direction === slideDirection.Previous) {
            if (matrixIdx > 0) {
                matrixIdx--;
            } else {
                matrixIdx = matrixLength - 1
            }
        } else if (direction === slideDirection.Next) {
            if (matrixIdx < matrixLength - 1) {
                matrixIdx++;
            } else {
                matrixIdx = 0;
            }
    }

    matrix = stackMatrix[matrixIdx];  
    console.debug(`Current Matrix Index: ${matrixIdx}`, matrix);
}

</script>

<h2 id="stack" class="text-2xl mt-4 pt-4 max-sm:flex max-sm:flex-col max-sm:items-center max-sm:justify-center">
    Stack
</h2>

<!-- Large view -->
<div class="hidden mt-4 lg:grid lg:grid-rows-4 lg:grid-flow-col">
    {#each stackList as stack}
      <div class="flex items-center space-x-2">
        <stack.icon class="w-10 h-10 {stack.style}" />
        <span>{stack.name}</span>
      </div>
    {/each}
</div>

<!-- Small view -->
<div id="controls-carousel" class="relative w-full lg:hidden">
    {#key matrix}
        <div class="relative overflow-hidden rounded-lg md:h-96 p-4">
            {#each matrix as row}
                <div class="grid grid-cols-2">
                    {#each row as stack}
                        <div class="flex flex-col items-center justify-center p-4"> 
                            <stack.icon class="w-10 h-10 {stack.style}" />
                            <div class="flex justify-center items-center">
                                <span>{stack.name}</span>
                            </div>
                        </div>
                    {/each}
                </div>
            {/each}
        </div>
    {/key}

    <!-- Transparent Left Area (Previous) -->
    <button type="button" 
            class="absolute z-30 top-0 left-0 h-full w-1/4 xs:w-[15%] sm:w-[20%] cursor-pointer bg-transparent group focus:outline-none"
            on:click={() => slideHandler('Previous')}>
        <svg class="absolute left-4 xs:left-1 top-1/2 transform -translate-y-1/2 w-5 xs:w-4 h-5 xs:h-4 text-white dark:text-gray-800" 
            aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
        </svg>
        <span class="sr-only">Previous</span>
    </button>

    <!-- Transparent Right Area (Next) -->
    <button type="button" 
            class="absolute z-30 top-0 right-0 h-full w-1/4 xs:w-[15%] sm:w-[20%] cursor-pointer bg-transparent group focus:outline-none"
            on:click={() => slideHandler('Next')}>
        <svg class="absolute right-4 xs:right-1 top-1/2 transform -translate-y-1/2 w-5 xs:w-4 h-5 xs:h-4 text-white dark:text-gray-800" 
             aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="sr-only">Next</span>
    </button>
</div>
