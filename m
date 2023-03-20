From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 13:07:47 -0000
Subject: [PATCH -next v15 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230317113538.10878-10-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-10-andy.chiu@sifive.com>
Message-ID: <38d91df7-1a94-4e55-acff-fa74899091d3@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 11:35:28AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
> 
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

> @@ -131,6 +166,9 @@ static __always_inline bool has_vector(void) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 		do {} while (0)
                                        ^
vim complains that you added a space here, between the first and second
tabs.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +#define riscv_v_vstate_save(task, regs)		do {} while (0)
> +#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/348d2c83/attachment-0001.sig>
