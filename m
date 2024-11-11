From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 15:37:09 +0100
Subject: [kvm-unit-tests PATCH 0/4] riscv: A few SMP fixes
In-Reply-To: <20241023132130.118073-6-andrew.jones@linux.dev>
References: <20241023132130.118073-6-andrew.jones@linux.dev>
Message-ID: <20241111-11e36ccba55a58ab6328c12f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 23, 2024 at 03:21:31PM +0200, Andrew Jones wrote:
> tl;dr - these patches are improvement to the riscv framework to better
> support the SBI HSM tests.
> 
> The first patch is a simpler alternative to [1] and [2] which doesn't
> require us to decide how best to make the number configurable. The
> second patch just adds sanity checking to make sure we can expect the
> SBI implementation to accept all hartids mapped from the present mask.
> The third patch was already posted once before[3] with a slightly
> different summary. It and the last patch improve smp_boot_secondary()
> since the SBI HSM tests were attempting to make workarounds for odd
> behaviors.
> 
> [1] https://lore.kernel.org/all/20240820170150.377580-2-andrew.jones at linux.dev/
> [2] https://lore.kernel.org/all/20240903143946.834864-6-andrew.jones at linux.dev/
> [3] https://lore.kernel.org/all/20240904120812.1798715-2-andrew.jones at linux.dev/
> 
> Andrew Jones (4):
>   riscv: Bump NR_CPUS to 256
>   riscv: Filter unmanaged harts from present mask
>   riscv: Fix secondary_entry
>   riscv: Rework smp_boot_secondary
> 
>  lib/riscv/asm/processor.h |  1 +
>  lib/riscv/asm/setup.h     |  2 +-
>  lib/riscv/setup.c         | 11 ++++++---
>  lib/riscv/smp.c           | 49 +++++++++++++++++++++++++++------------
>  riscv/cstart.S            |  7 +++---
>  5 files changed, 48 insertions(+), 22 deletions(-)
> 
> -- 
> 2.47.0

Merged to master through riscv/queue.

Thanks,
drew

