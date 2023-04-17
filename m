From: Heiko Stübner <heiko@sntech.de>
Date: Mon, 17 Apr 2023 17:55:03 +0200
Subject: [PATCH -next v18 07/20] riscv: Introduce riscv_v_vsize to record size of
 Vector context
In-Reply-To: <20230414155843.12963-8-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-8-andy.chiu@sifive.com>
Message-ID: <2456518.jZfb76A358@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Freitag, 14. April 2023, 17:58:30 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system. If a core detects VLENB
> that is different from the boot core, then it warns and turns off V
> support for user space.
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



