<script lang="ts">
    import MdiCompassOutline from '~icons/mdi/compass-outline';
    import MingcuteSuitcaseLine from '~icons/mingcute/suitcase-line';
    import LucidePen from '~icons/lucide/pen';
    import RiUserLine from '~icons/ri/user-line';
    import BiGrid1x2 from '~icons/bi/grid-1x2';
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
        { name: 'Explore', href: '#Explore', icon: MdiCompassOutline },
        { name: 'Experience', href: '#experience', icon: MingcuteSuitcaseLine },
        { name: 'Projects', href: '#projects', icon: LucidePen },
        { name: 'About', href: '#about', icon: RiUserLine },
      ],
      Resources: [
        { name: 'Feed', href: '#feed', icon: BiGrid1x2 },
        { name: 'Stack', href: '#stack', icon: MdiStackoverflow },
      ],
      Connect: [
        { name: 'Contact', href: '#contact', icon: MdiContactOutline },
        { name: 'LinkedIn', href: '#somelink', icon: MdiLinkedin },
        { name: 'GitHub', href: '#somelink', icon: MdiGithub },
      ],
    };
  </script>
  
  <aside id="default-sidebar" class="h-full top-0 max-h-screen max-w-[12rem] z-40 transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800">
      {#each Object.entries(sideBarSections) as [sectionName, sectionItems]}
        <ul class="space-y-2 font-medium align-middle">
          <li class="font-bold text-gray-900 dark:text-white">{sectionName}</li>
          {#each sectionItems as tab}
            <li>
              <a href={tab.href} class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                <!-- Render the icon directly -->
                <tab.icon class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
                <span class="ms-3">{tab.name}</span>
              </a>
            </li>
          {/each}
        </ul>
      {/each}
    </div>
  </aside>
  