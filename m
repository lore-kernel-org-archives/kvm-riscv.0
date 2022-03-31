From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 30 Mar 2022 22:52:52 -0700 (PDT)
Subject: question about arch/riscv/kvm/mmu.c
In-Reply-To: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
Message-ID: <mhng-9835bc56-8f99-4fd6-bccc-262b642a2ccb@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 16 Mar 2022 14:10:06 PDT (-0700), julia.lawall at inria.fr wrote:
> Hello,
>
> The function kvm_riscv_stage2_map contains the code:
>
> mmu_seq = kvm->mmu_notifier_seq;
>
> I noticed that in every other place in the kernel where the
> mmu_notifier_seq field is read, there is a read barrier after it.  Is
> there some reason why it is not necessary here?

I guess that's a better question for Atish and Anup, but certainly 
nothing jumps out at me.  There's a pretty good comment in the arm64 
port about their barrier:

        mmu_seq = vcpu->kvm->mmu_notifier_seq;
        /*
         * Ensure the read of mmu_notifier_seq happens before we call
         * gfn_to_pfn_prot (which calls get_user_pages), so that we don't risk
         * the page we just got a reference to gets unmapped before we have a
         * chance to grab the mmu_lock, which ensure that if the page gets
         * unmapped afterwards, the call to kvm_unmap_gfn will take it away
         * from us again properly. This smp_rmb() interacts with the smp_wmb()
         * in kvm_mmu_notifier_invalidate_<page|range_end>.
         *
         * Besides, __gfn_to_pfn_memslot() instead of gfn_to_pfn_prot() is
         * used to avoid unnecessary overhead introduced to locate the memory
         * slot because it's always fixed even @gfn is adjusted for huge pages.
         */
        smp_rmb();

I don't see anything that would invalidate that reasoning for us.  My 
guess is that we should have a similar barrier (and coment, and maybe 
call __gfn_to_pfn_memslot() too).  There's a handful of other 
interesting-looking differences between the riscv and arm64 ports around 
here that might be worth looking into as well.

Might also be worth updating that comment to indicate that the actual 
wmb() is in kvm_dec_notifier_count()?  Also, to make it sound less like 
arm64 is calling gfn_to_pfn_prot()...

