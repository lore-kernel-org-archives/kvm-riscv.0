From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 7 Dec 2023 15:46:16 +0100
Subject: [PATCH v1 04/14] RISC-V: paravirt: Add kconfigs
In-Reply-To: <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-20-ajones@ventanamicro.com>
 <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
Message-ID: <20231207-963f31814d2502cbc058647c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 07, 2023 at 02:07:28PM +0000, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 07:11:24PM +0100, Andrew Jones wrote:
> > Now that we can support steal-time accounting, add the kconfig
> > knobs allowing it to be enabled.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> In hindsight, should this be squashed with the code actually adding the
> support?

Yeah, this can be squashed, particularly because the configs are off by
default anyway. Will do.

Thanks,
drew

