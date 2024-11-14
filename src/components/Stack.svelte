<script lang="ts">
    import type { Component } from 'svelte';
	import type { SVGAttributes } from 'svelte/elements';

    import DeviconBlazor from '~icons/devicon/blazor';
    import SkillIconsDotnet from '~icons/skill-icons/dotnet';
    import DeviconPythonWordmark from '~icons/devicon/python-wordmark';
    import SkillIconsGitlabLight from '~icons/skill-icons/gitlab-light';
    import DeviconPytorch from '~icons/devicon/pytorch';
    import DeviconSvelte from '~icons/devicon/svelte';
    import DeviconAzure from '~icons/devicon/azure';
    import SkillIconsTypescript from '~icons/skill-icons/typescript';
    import DeviconHtml5 from '~icons/devicon/html5';
    import SkillIconsCss from '~icons/skill-icons/css';
    import SkillIconsTailwindcssDark from '~icons/skill-icons/tailwindcss-dark';
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
    import DeviconAzuredevops from '~icons/devicon/azuredevops';
    import DeviconMatlab from '~icons/devicon/matlab';

    interface Stack {
      name: string;
      icon: Component<SVGAttributes<SVGSVGElement>>;
      style?: string;
    }

    const stackList: Stack[] = [
        { name: '.NET', icon: SkillIconsDotnet },
        { name: 'Blazor', icon: DeviconBlazor },
        { name: 'Azure', icon: DeviconAzure },
        { name: 'DevOps', icon: DeviconAzuredevops},
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
        { name: 'TailwindCSS', icon: SkillIconsTailwindcssDark },
        { name: 'Svelte', icon: DeviconSvelte },
        { name: 'Iconify', icon: SimpleIconsIconify, style: 'text-blue-500' },
        { name: 'WebAPI', icon: EosIconsApiOutlined, style: 'text-green-500' },
        { name: 'PostgreSQL', icon: DeviconPostgresql },
        { name: 'MongoDB', icon: DeviconMongodb },
        { name: 'Redis', icon: DeviconRedis },
        { name: 'MSSQL', icon: TablerSql },
        { name: 'Matlab', icon: DeviconMatlab },
    ];

</script>

<h1 class="text-2xl mt-4 max-sm:flex max-sm:flex-col max-sm:items-center max-sm:justify-center">
    <a href="#Stack">Stack</a>
</h1>

<div class="grid grid-rows-4 grid-flow-col gap-4 mt-4">
    {#each stackList as stack}
      <div class="flex items-center space-x-2">
        <stack.icon class={stack.style} />
        <span>{stack.name}</span>
      </div>
    {/each}
</div>
  
  