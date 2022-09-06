From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 6 Sep 2022 10:55:33 +0200
Subject: [PATCH 1/3] RISC-V: Output cbom-block-size
In-Reply-To: <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
Message-ID: <20220906085533.orfbu5gyeur5xj6i@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley at microchip.com wrote:
> On 06/09/2022 09:35, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Provide an info message with the block size when the Zicbom extension is
> > present and the block size has been determined.
> 
> Why might someone care about this?

I was unaware of anywhere else besides hardware descriptions where this is
published. And, while dmesg isn't really publishing it in a way that is
useful to anything other than human readers either, it at least makes it
easy for a user to check it for sanity purposes (which is what I used it
for) or even for applying it if they want to write something that needs it
and the OS provides U-mode access to CMO.

I'm not married to the idea, though, so if people would rather have less
logs than this information, then I'm fine with dropping the patch.

Thanks,
drew

> 
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   arch/riscv/mm/cacheflush.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index e5b087be1577..8595baf8e403 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> >                  }
> >          }
> > 
> > -       if (probed_block_size)
> > +       if (probed_block_size) {
> >                  riscv_cbom_block_size = probed_block_size;
> > +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> > +       }
> >   }
> >   #endif
> > --
> > 2.37.2
> > 
> 

