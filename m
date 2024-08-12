From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:07:11 +0200
Subject: [kvm-unit-tests PATCH v2 0/7] riscv: 32-bit should use
 phys_addr_t
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812-7d3025fd062de8ac975912db@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 12, 2024 at 03:44:52PM GMT, Andrew Jones wrote:
> For v2 not only do we use phys_addr_t where we should to allow unit tests
> to pretend like high words matter on rv32, but we actually get it to work
> by adding a few more patches. Some new DBCN tests will make use of it.
> 
> Andrew Jones (7):
>   riscv: Fix virt_to_phys again
>   riscv: setup: Apply VA_BASE check to rv64
>   riscv: Support up to 34-bit physical addresses on rv32, sort of
>   riscv: Track memory above 3G
>   riscv: mmu: Sanity check input physical addresses
>   riscv: Define and use PHYS_PAGE_MASK
>   riscv: mmu: Ensure order of PTE update and sfence
> 
>  lib/memregions.h    |  1 +
>  lib/riscv/asm/io.h  |  4 ++--
>  lib/riscv/asm/mmu.h |  3 +++
>  lib/riscv/mmu.c     | 45 +++++++++++++++++++++++++++++----------------
>  lib/riscv/setup.c   | 19 +++++++++++++------
>  lib/riscv/smp.c     |  7 ++++++-
>  6 files changed, 54 insertions(+), 25 deletions(-)
> 
> -- 
> 2.45.2
>

Queued on riscv/queue, https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv%2Fqueue

drew

