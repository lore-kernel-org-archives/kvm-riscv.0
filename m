From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 12:45:28 +0200
Subject: [PATCH -next v17 02/20] riscv: Extending cpufeature.c to detect
 V-extension
In-Reply-To: <20230327164941.20491-3-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-3-andy.chiu@sifive.com>
Message-ID: <4789687.GXAFRqVoOG@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:22 CEST schrieb Andy Chiu:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add V-extension into riscv_isa_ext_keys array and detect it with isa
> string parsing.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




