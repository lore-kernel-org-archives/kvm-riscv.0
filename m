From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 13:02:52 +0200
Subject: [PATCH -next v17 07/20] riscv: Introduce riscv_v_vsize to record size of
 Vector context
In-Reply-To: <20230327164941.20491-8-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-8-andy.chiu@sifive.com>
Message-ID: <7503786.EvYhyI6sBW@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:27 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. 

> It assumes all
> harts has the same capabilities in a SMP system.

is this mandated somewhere?

Because for most other things we seem to want to check that this is
actually true.

So somehow I'd expect the kernel to at least check the VLEN on each
hart and loudly complain if those do not match?

> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


Heiko



