From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 24 Feb 2023 15:36:55 +0100
Subject: [PATCH v5 6/8] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <20230224142530.mq5qzfycvyvtnqiv@orel>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-7-ajones@ventanamicro.com>
 <36abc02f-ef35-88a8-1fa8-ce7cebbae7ea@codethink.co.uk>
 <20230224142530.mq5qzfycvyvtnqiv@orel>
Message-ID: <20230224143655.5scd7nxwunqpr3u3@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 03:25:30PM +0100, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 02:00:44PM +0000, Ben Dooks wrote:
> > On 21/02/2023 19:09, Andrew Jones wrote:
...
> > > +/* void clear_page(void *page) */
> > > +ENTRY(__clear_page)
> > > +WEAK(clear_page)
> > 
> > out of interest, why the __clear_page() entry and the
> > WEAK(clear_page)?
> 
> I was inspired by memset, but, in hindsight, it doesn't make sense for
> clear_page to be weak.

Of course I failed to completely follow the memset pattern, which also
has an export (in riscv_ksyms.c). I prefer the export in clear_page.S,
though, as you've done.

Thanks,
drew

