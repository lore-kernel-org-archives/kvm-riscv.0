From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 16 May 2023 11:15:08 +0800
Subject: [PATCH -next v19 04/24] riscv: Add new csr defines related to
 vector extension
In-Reply-To: <mhng-18df71ab-832b-4312-9319-52ae8b3da0d8@palmer-ri-x1c9a>
References: <20230509103033.11285-5-andy.chiu@sifive.com> <mhng-18df71ab-832b-4312-9319-52ae8b3da0d8@palmer-ri-x1c9a>
Message-ID: <CABgGipUfekA2fHVz4L3EzynF-rVMwTJpGBcusWwXXAon3pZLYA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 12, 2023 at 6:56?AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 09 May 2023 03:30:13 PDT (-0700), andy.chiu at sifive.com wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > Follow the riscv vector spec to add new csr numbers.
> >
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index b6acb7ed115f..b98b3b6c9da2 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -24,16 +24,24 @@
> >  #define SR_FS_CLEAN  _AC(0x00004000, UL)
> >  #define SR_FS_DIRTY  _AC(0x00006000, UL)
> >
> > +#define SR_VS                _AC(0x00000600, UL) /* Vector Status */
> > +#define SR_VS_OFF    _AC(0x00000000, UL)
> > +#define SR_VS_INITIAL        _AC(0x00000200, UL)
> > +#define SR_VS_CLEAN  _AC(0x00000400, UL)
> > +#define SR_VS_DIRTY  _AC(0x00000600, UL)
> > +
> >  #define SR_XS                _AC(0x00018000, UL) /* Extension Status */
> >  #define SR_XS_OFF    _AC(0x00000000, UL)
> >  #define SR_XS_INITIAL        _AC(0x00008000, UL)
> >  #define SR_XS_CLEAN  _AC(0x00010000, UL)
> >  #define SR_XS_DIRTY  _AC(0x00018000, UL)
> >
> > +#define SR_FS_VS     (SR_FS | SR_VS) /* Vector and Floating-Point Unit */
> > +
> >  #ifndef CONFIG_64BIT
> > -#define SR_SD                _AC(0x80000000, UL) /* FS/XS dirty */
> > +#define SR_SD                _AC(0x80000000, UL) /* FS/VS/XS dirty */
> >  #else
> > -#define SR_SD                _AC(0x8000000000000000, UL) /* FS/XS dirty */
> > +#define SR_SD                _AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
> >  #endif
> >
> >  #ifdef CONFIG_64BIT
> > @@ -375,6 +383,12 @@
> >  #define CSR_MVIPH            0x319
> >  #define CSR_MIPH             0x354
> >
> > +#define CSR_VSTART           0x8
> > +#define CSR_VCSR             0xf
> > +#define CSR_VL                       0xc20
> > +#define CSR_VTYPE            0xc21
> > +#define CSR_VLENB            0xc22
> > +
> >  #ifdef CONFIG_RISCV_M_MODE
> >  # define CSR_STATUS  CSR_MSTATUS
> >  # define CSR_IE              CSR_MIE
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

This patch also has your R-b and has not been changed since v13.

Thanks,
Andy

