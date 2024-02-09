From: Will Deacon <will@kernel.org>
Date: Fri,  9 Feb 2024 15:55:57 +0000
Subject: [kvmtool PATCH] riscv: Fix guest poweroff when using PLIC emulation
In-Reply-To: <20231130041633.78725-1-apatel@ventanamicro.com>
References: <20231130041633.78725-1-apatel@ventanamicro.com>
Message-ID: <170749363997.2620566.12528485009430198200.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 30 Nov 2023 09:46:33 +0530, Anup Patel wrote:
> Recently due to commit 74af1456dfa0, the virtio device emulation
> in KVMTOOL now calls irq__update_msix_route() upon guest poweroff
> which results in KVMTOOL crash when Guest uses PLIC emulation in
> user space. This is because irq__update_msix_route() expects the
> irq_routing table to be available but the KVMTOOL PLIC emulation
> does not populate any irq_routing entries.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/1] riscv: Fix guest poweroff when using PLIC emulation
      https://git.kernel.org/will/kvmtool/c/f6cc06d6b535

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

