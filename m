From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 4 Apr 2023 18:31:49 +0200
Subject: [PATCH v4 9/9] RISC-V: KVM: Implement guest external interrupt
 line management
In-Reply-To: <20230404153452.2405681-10-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-10-apatel@ventanamicro.com>
Message-ID: <buomdae5cjxjctzleywsjqejf2k3d3zuwqi7zyrjq4fc2xzng5@mdxdojrdkm4j>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 04, 2023 at 09:04:52PM +0530, Anup Patel wrote:
> The RISC-V host will have one guest external interrupt line for each
> VS-level IMSICs associated with a HART. The guest external interrupt
> lines are per-HART resources and hypervisor can use HGEIE, HGEIP, and
> HIE CSRs to manage these guest external interrupt lines.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_aia.h |  10 ++
>  arch/riscv/kvm/aia.c             | 239 +++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c            |   3 +-
>  arch/riscv/kvm/vcpu.c            |   2 +
>  4 files changed, 253 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

