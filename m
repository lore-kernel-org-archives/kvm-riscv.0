From: Heiko Stübner <heiko@sntech.de>
Date: Mon, 17 Apr 2023 17:52:01 +0200
Subject: [PATCH -next v18 05/20] riscv: Disable Vector Instructions for kernel
 itself
In-Reply-To: <20230414155843.12963-6-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-6-andy.chiu@sifive.com>
Message-ID: <3758917.VqM8IeB0Os@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Freitag, 14. April 2023, 17:58:28 CEST schrieb Andy Chiu:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Disable vector instructions execution for kernel mode at its entrances.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



