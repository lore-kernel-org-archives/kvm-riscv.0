From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 22:36:47 -0000
Subject: [PATCH -next v14 06/19] riscv: Introduce Vector enable/disable
 helpers
In-Reply-To: <20230224170118.16766-7-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-7-andy.chiu@sifive.com>
Message-ID: <Y/6B9DEhO0hivJVA@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:05PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: create new patch from meshup, introduced asm variant]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: remove calls from asm thus remove asm vaiant]

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/bc2760a8/attachment-0001.sig>
