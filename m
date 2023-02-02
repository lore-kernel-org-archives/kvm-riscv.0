From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 2 Feb 2023 15:59:48 +0100
Subject: [PATCH v4 01/14] perf: RISC-V: Define helper functions expose
 hpm counter width and count
In-Reply-To: <20230201231250.3806412-2-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-2-atishp@rivosinc.com>
Message-ID: <20230202145948.jrgjc27t2tbney2l@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 01, 2023 at 03:12:37PM -0800, Atish Patra wrote:
> KVM module needs to know how many hardware counters and the counter
> width that the platform supports. Otherwise, it will not be able to show
> optimal value of virtual counters to the guest. The virtual hardware
> counters also need to have the same width as the logical hardware
> counters for simplicity. However, there shouldn't be mapping between
> virtual hardware counters and logical hardware counters. As we don't
> support hetergeneous harts or counters with different width as of now,
> the implementation relies on the counter width of the first available
> programmable counter.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 37 ++++++++++++++++++++++++++++++++--
>  include/linux/perf/riscv_pmu.h |  3 +++
>  2 files changed, 38 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

