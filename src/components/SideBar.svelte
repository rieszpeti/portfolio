<script lang="ts">
    import MingcuteSuitcaseLine from '~icons/mingcute/suitcase-line';
    import LucidePen from '~icons/lucide/pen';
    import RiUserLine from '~icons/ri/user-line';
    import CarbonEducation from '~icons/carbon/education';
    import MdiStackoverflow from '~icons/mdi/stackoverflow';
    import MdiContactOutline from '~icons/mdi/contact-outline';
    import MdiLinkedin from '~icons/mdi/linkedin';
    import MdiGithub from '~icons/mdi/github';

    import type { Component } from 'svelte';
    import type { SVGAttributes } from 'svelte/elements';
  
    interface SideBarSection {
      name: string;
      href: string;
      icon: Component<SVGAttributes<SVGSVGElement>>;
    }
  
    interface SideBar {
      [key: string]: SideBarSection[];
    }
  
    const sideBarSections: SideBar = {
      Main: [
        { name: 'Stack', href: '#stack', icon: MdiStackoverflow },
        { name: 'Experience', href: '#experience', icon: MingcuteSuitcaseLine },
        { name: 'Projects', href: '#projects', icon: LucidePen },
        { name: 'Education', href: '#education', icon: CarbonEducation },
        { name: 'About', href: '#about', icon: RiUserLine },
      ],
      Connect: [
        { name: 'Contact', href: '#contact', icon: MdiContactOutline },
        { name: 'LinkedIn', href: import.meta.env.VITE_LINKEDIN, icon: MdiLinkedin },
        { name: 'GitHub', href: import.meta.env.VITE_GITHUB, icon: MdiGithub },
      ],
    };
  </script>
  
  <aside id="default-sidebar" class="h-full top-0 max-h-screen max-w-[12rem] z-40 transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto">
      {#each Object.entries(sideBarSections) as [sectionName, sectionItems]}
        <ul class="space-y-2 font-medium align-middle">
          <li class="mt-6 font-bold text-gray-900 dark:text-white">{sectionName}</li>
          {#each sectionItems as tab}
            <li>
              <a href={tab.href} class="flex items-center p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 group">
                <tab.icon class="w-5 h-5 transition duration-75 dark:group-hover:text-white font-color" />
                <span class="ms-3">{tab.name}</span>
              </a>
            </li>
          {/each}
        </ul>
      {/each}
    </div>
  </aside>
  