From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 4 Oct 2023 23:49:56 -0700
Subject: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
In-Reply-To: <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com>
 <ZRpitP5y1yhzKwbE@infradead.org>
 <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
Message-ID: <ZR5clPwviAN2SHVY@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 02, 2023 at 09:06:08PM +0530, Anup Patel wrote:
> > extensions?
> >
> 
> We already have few T-Head specific extensions so Linux RISC-V
> does allow vendor extensions.

Only for kernel internal operation and to actually boot the
chip.  IMHO still the wrong tradeoff, but very different from actually
user visible extensions that will lead to fragmentation of the
ecoysystem.

