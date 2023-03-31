From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 15:38:41 +0200
Subject: [PATCH -next v17 16/20] riscv: prevent stack corruption by reserving
 task_pt_regs(p) early
In-Reply-To: <20230327164941.20491-17-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-17-andy.chiu@sifive.com>
Message-ID: <14872268.tv2OnDr8pf@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:36 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Early function calls, such as setup_vm(), relocate_enable_mmu(),
> soc_early_init() etc, are free to operate on stack. However,
> PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
> reserved for the placement of per-task register context pointed by
> task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
> the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
> tests, treating the kernel to save V context before V was actually
> allocated, resulting in a kernel panic.
> 
> Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
> calls from the top-level assembly.
> 
> Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



