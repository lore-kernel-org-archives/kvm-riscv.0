From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 13:03:27 -0000
Subject: [PATCH -next v15 07/19] riscv: Introduce riscv_v_vsize to record
 size of Vector context
In-Reply-To: <20230317113538.10878-8-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-8-andy.chiu@sifive.com>
Message-ID: <78b957cb-c41d-4152-8f5b-b4bae615c8be@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 11:35:26AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system.
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

FYI git am complains while applying this patch about whitespace issues:

Applying: riscv: Introduce riscv_v_vsize to record size of Vector context
Using index info to reconstruct a base tree...
M	arch/riscv/kernel/cpufeature.c
.git/rebase-apply/patch:90: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Falling back to patching base and 3-way merge...

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/cc799d35/attachment-0001.sig>
