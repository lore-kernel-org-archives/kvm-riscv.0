From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 2 Oct 2023 21:06:08 +0530
Subject: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
In-Reply-To: <ZRpitP5y1yhzKwbE@infradead.org>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com> <ZRpitP5y1yhzKwbE@infradead.org>
Message-ID: <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 2, 2023 at 11:57?AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Sep 19, 2023 at 09:23:37AM +0530, Anup Patel wrote:
> > The Veyron-V1 CPU supports custom conditional arithmetic and
> > conditional-select/move operations referred to as XVentanaCondOps
> > extension. In fact, QEMU RISC-V also has support for emulating
> > XVentanaCondOps extension.
> >
> > Let us detect XVentanaCondOps extension from ISA string available
> > through DT or ACPI.
>
> Umm, I though Linux/riscv would never support vendor specific
> extensions?
>

We already have few T-Head specific extensions so Linux RISC-V
does allow vendor extensions.

Regards,
Anup

