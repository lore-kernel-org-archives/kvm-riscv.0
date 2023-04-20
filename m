From: Lorenzo Stoakes <lstoakes@gmail.com>
Date: Thu, 20 Apr 2023 20:42:42 +0100
Subject: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify
 ioremap/unmap changes
In-Reply-To: <20230419221716.3603068-2-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-2-atishp@rivosinc.com>
Message-ID: <b58eadb7-c80c-42fe-b803-09f2f466c0bd@lucifer.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm a vmalloc reviewer too now -next/mm-unstable get_maintainer.pl should say
so, but forgivable because perhaps you ran against another tree but FYI for
future I'd appreciate a cc- :)

On Wed, Apr 19, 2023 at 03:16:29PM -0700, Atish Patra wrote:
> From: Rajnesh Kanwal <rkanwal@rivosinc.com>
>
> In virtualization, the guest may need notify the host about the ioremap
> regions. This is a common usecase in confidential computing where the
> host only provides MMIO emulation for the regions specified by the guest.
>
> Add a pair if arch specific callbacks to track the ioremapped regions.

Nit: typo if -> of.

>
> This patch is based on pkvm patches. A generic arch config can be added
> similar to pkvm if this is going to be the final solution. The device
> authorization/filtering approach is very different from this and we
> may prefer that one as it provides more flexibility in terms of which
> devices are allowed for the confidential guests.

So it's an RFC that assumes existing patches are already applied or do you mean
something else here? What do I need to do to get to a vmalloc.c with your patch
applied?

I guess this is pretty nitty since your changes are small here but be good to
know!

>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  mm/vmalloc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bef6cf2..023630e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -304,6 +304,14 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>
> +__weak void ioremap_phys_range_hook(phys_addr_t phys_addr, size_t size, pgprot_t prot)
> +{
> +}
> +
> +__weak void iounmap_phys_range_hook(phys_addr_t phys_addr, size_t size)
> +{
> +}
> +

I'm not sure if this is for efficiency by using a weak reference, however, and
perhaps a nit, but I'd prefer an arch_*() that's defined in a header somewhere,
as it does hide the call paths quite effectively.

>  int ioremap_page_range(unsigned long addr, unsigned long end,
>  		phys_addr_t phys_addr, pgprot_t prot)
>  {
> @@ -315,6 +323,10 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>  	if (!err)
>  		kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					 ioremap_max_page_shift);
> +
> +	if (!err)
> +		ioremap_phys_range_hook(phys_addr, end - addr, prot);
> +
>  	return err;
>  }
>
> @@ -2772,6 +2784,10 @@ void vunmap(const void *addr)
>  				addr);
>  		return;
>  	}
> +
> +	if (vm->flags & VM_IOREMAP)
> +		iounmap_phys_range_hook(vm->phys_addr, get_vm_area_size(vm));
> +

There are places other than ioremap_page_range() that can set VM_IOREMAP,
e.g. vmap_pfn(), so this may trigger with addresses other than those specified
in the original hook. Is this intended?

>  	kfree(vm);
>  }
>  EXPORT_SYMBOL(vunmap);
> --
> 2.25.1
>

