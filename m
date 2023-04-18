From: Conor Dooley <conor@kernel.org>
Date: Tue, 18 Apr 2023 19:09:07 -0000
Subject: [RFC PATCH 04/14] RISC-V: paravirt: Add kconfigs
In-Reply-To: <20230417103402.798596-5-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-5-ajones@ventanamicro.com>
Message-ID: <20230418-bonded-deduct-b771c133ccf4@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 17, 2023 at 12:33:52PM +0200, Andrew Jones wrote:
> Now that we can support steal-time accounting, add the kconfig
> knobs allowing it to be enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Surely this won't change even if the SBI spec proposal does, right...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230418/6fbdfae1/attachment-0001.sig>
