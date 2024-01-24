From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:52:47 +0100
Subject: [kvm-unit-tests PATCH 03/24] arm/arm64: Move cpumask.h to common
 lib
In-Reply-To: <20240124071815.6898-29-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
 <20240124071815.6898-29-andrew.jones@linux.dev>
Message-ID: <1284c5bd-8c2d-4228-b2db-915548672eac@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> RISC-V will also make use of cpumask.h, so move it to the arch-common
> directory.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   lib/arm/asm/gic-v2.h        | 2 +-
>   lib/arm/asm/gic-v3.h        | 2 +-
>   lib/arm/asm/gic.h           | 2 +-
>   lib/arm/asm/smp.h           | 2 +-
>   lib/arm/mmu.c               | 2 +-
>   lib/arm/smp.c               | 2 +-
>   lib/arm64/asm/cpumask.h     | 1 -
>   lib/{arm/asm => }/cpumask.h | 9 ++++-----
>   8 files changed, 10 insertions(+), 12 deletions(-)
>   delete mode 100644 lib/arm64/asm/cpumask.h
>   rename lib/{arm/asm => }/cpumask.h (94%)

Reviewed-by: Thomas Huth <thuth@redhat.com>



