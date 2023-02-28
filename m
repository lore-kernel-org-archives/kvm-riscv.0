From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 22:39:07 -0000
Subject: [PATCH -next v14 07/19] riscv: Introduce riscv_v_vsize to record
 size of Vector context
In-Reply-To: <20230224170118.16766-8-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-8-andy.chiu@sifive.com>
Message-ID: <Y/6CgMvoRciA7Ow1@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:06PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system.
> 
> [guoren at linux.alibaba.com: add has_vector checking]
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/0563a2f5/attachment-0001.sig>
