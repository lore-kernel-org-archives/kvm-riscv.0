From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Sun, 09 Jan 2022 11:48:06 -0800 (PST)
Subject: [PATCH 0/5] riscv: misc clean up
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <mhng-4e157e52-f315-48ee-ac92-03628c35cbde@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 28 Nov 2021 08:07:36 PST (-0800), jszhang at kernel.org wrote:
> This series is a misc clean up: clean up useless LoCs, or make some
> functions static, or mark function pointer as __initdata, or remove
> one function().
>
> Jisheng Zhang (5):
>   riscv: remove cpu_stop()
>   riscv: head: make secondary_start_common() static
>   riscv: kvm: make kvm_riscv_vcpu_fp_clean() static

Probably best to split out the KVM patches, as they go in via a 
different tree.

>   riscv: errata: alternative: mark vendor_patch_func __initdata
>   riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign
>
>  arch/riscv/errata/alternative.c | 3 ++-
>  arch/riscv/include/asm/smp.h    | 2 --
>  arch/riscv/kernel/cpu-hotplug.c | 8 +-------
>  arch/riscv/kernel/head.S        | 9 ++-------
>  arch/riscv/kvm/vcpu_fp.c        | 2 +-
>  5 files changed, 6 insertions(+), 18 deletions(-)

These are on for-next (aside from the KVM one, which Anup has already 
picked up).

Thanks!



