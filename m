From: Heiko Stübner <heiko@sntech.de>
Date: Sun, 02 Apr 2023 00:20:32 +0200
Subject: [PATCH -next v17 13/20] riscv: signal: Add sigcontext save/restore for
 vector
In-Reply-To: <20230327164941.20491-14-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-14-andy.chiu@sifive.com>
Message-ID: <2624132.Isy0gbHreE@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:33 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch facilitates the existing fp-reserved words for placement of
> the first extension's context header on the user's sigframe. A context
> header consists of a distinct magic word and the size, including the
> header itself, of an extension on the stack. Then, the frame is followed
> by the context of that extension, and then a header + context body for
> another extension if exists. If there is no more extension to come, then
> the frame must be ended with a null context header. A special case is
> rv64gc, where the kernel support no extensions requiring to expose
> additional regfile to the user. In such case the kernel would place the
> null context header right after the first reserved word of
> __riscv_q_ext_state when saving sigframe. And the kernel would check if
> all reserved words are zeros when a signal handler returns.
> 
> __riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
> 			~	~
> 	.reserved[0]--->|0	|<-	.reserved
> 		<-------|magic	|<-	.hdr
> 		|	|size	|_______ end of sc_fpregs
> 		|	|ext-bdy|
> 		|	~	~
> 	+)size	------->|magic	|<- another context header
> 			|size	|
> 			|ext-bdy|
> 			~	~
> 			|magic:0|<- null context header
> 			|size:0	|
> 
> The vector registers will be saved in datap pointer. The datap pointer
> will be allocated dynamically when the task needs in kernel space. On
> the other hand, datap pointer on the sigframe will be set right after
> the __riscv_v_ext_state data structure.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




