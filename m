From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 14:07:28 +0000
Subject: [PATCH v1 04/14] RISC-V: paravirt: Add kconfigs
In-Reply-To: <20231205181119.207204-20-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-20-ajones@ventanamicro.com>
Message-ID: <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 05, 2023 at 07:11:24PM +0100, Andrew Jones wrote:
> Now that we can support steal-time accounting, add the kconfig
> knobs allowing it to be enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

In hindsight, should this be squashed with the code actually adding the
support?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/9c6cadd8/attachment.sig>
