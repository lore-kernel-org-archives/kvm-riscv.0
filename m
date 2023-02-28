From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 22:31:21 -0000
Subject: [PATCH -next v14 03/19] riscv: Add new csr defines related to
 vector extension
In-Reply-To: <20230224170118.16766-4-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-4-andy.chiu@sifive.com>
Message-ID: <Y/6Ar88HPkwocNUe@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:02PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Follow the riscv vector spec to add new csr numbers.
> 
> [guoren at linux.alibaba.com: first porting for new vector related csr]
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andyc: added SR_FS_VS]
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 0e571f6483d9..add51662b7c3 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,16 +24,24 @@
>  #define SR_FS_CLEAN	_AC(0x00004000, UL)
>  #define SR_FS_DIRTY	_AC(0x00006000, UL)
>  
> +#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF       _AC(0x00000000, UL)
> +#define SR_VS_INITIAL   _AC(0x00000200, UL)
> +#define SR_VS_CLEAN     _AC(0x00000400, UL)
> +#define SR_VS_DIRTY     _AC(0x00000600, UL)

I just noticed that these are space-aligned, while the file uses tabs.
Could you please fix that up when you resubmit?

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/79dbaf0d/attachment-0001.sig>
