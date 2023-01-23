From: Conor Dooley <conor@kernel.org>
Date: Mon, 23 Jan 2023 18:25:22 +0000
Subject: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
In-Reply-To: <20230123155404.oqcfufnot4f2vjw7@orel>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
 <20230123155404.oqcfufnot4f2vjw7@orel>
Message-ID: <Y87REk8M/lDbQUhb@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Drew, Rob,

On Mon, Jan 23, 2023 at 04:54:04PM +0100, Andrew Jones wrote:
> On Mon, Jan 23, 2023 at 08:33:56AM -0600, Rob Herring wrote:
> > On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > The Zicboz operates on a block-size defined for the cpu-core,
> > > which does not necessarily match other cache-sizes used.
> > 
> > Please use get_maintainers.pl and send patches to the correct lists.
> 
> Yup, Conor also pointed out that I forgot to update the CC list when
> adding this patch to the series.
> 
> > 
> > I have no idea what Zicboz is. How does it relate to Zicbom for which
> > we already have a block size property? I really hate one by one
> > property additions because they lead to poorly designed bindings. So
> > what's next? What other information might be needed?
> 
> Zicbom and Zicboz are both RISC-V ISA extensions for cache-block operation
> (CBO) instructions. Zicbom defines the instructions cbo.inval, cbo.clean,
> and cbo.flush while Zicboz only defines cbo.zero. While it's probably
> likely that the cache block sizes which Zicbom and Zicboz use will be
> the same when both are implemented, the specification does not require it.
> With that in mind, it makes sense to me that Zicbom has its own property
> and that Zicboz could follow Zicbom's pattern with its own property as
> well.
> 
> That said, having a generic block size property which is used in the
> absence of the per-extension block size properties would allow DTs to only
> specify the size once when they're the same. In my reply to Conor, I
> suggested introducing a cbo-block-size property for this purpose, but Anup
> suggests we just expand the purpose of cbom-block-size. Expanding cbom-
> block-size's purpose would allow its size to be used with cbo.zero in the
> absence of a cboz-block-size property. Additionally, we could defer the
> introduction of the cboz-block-size property until some system needs it,
> which may be never.
> 
> As far as to what's coming next, I'm not aware of a plan for more of these
> types of properties at this time, but the CMO spec also describes prefetch
> instructions, which are defined under the Zicbop extension. If Zicbop
> support is added, then it should follow the same pattern as we agree for
> Zicboz, which is either
> 
>  a. Add cboz-block-size and require it (as this series currently does)

heh, be careful with the word "require", in dt-binding terms it's not
required - we just get a pr_err() and the feature is disabled, right?

This is most clear of the options though, even if it will likely be
superfluous most of the time...

>  c. Don't add cboz-block-size, only expand the function of cbom-block-size
>     and use it. If a need arises for cboz-block-size some day, then it
>     can be added at that time.

I don't really think that this one makes much sense. It'd be perfectly
okay to have Zicboz without Zicbom, even if that scenario may be
unlikely.
Having a system with Zicboz in the isa string, a cbom-block-size just
sounds like a source of confusion.
IMO, there's enough potential crud that "random" extensions may bring
going forward that I'd rather not make decisions here that complicate
matters more.

>  b. Add cboz-block-size, expand the function of cbom-block-size to be
>     a fallback, and fallback to cbom-block-size when cboz-block-size is
>     absent

I personally think that this one is pretty fair. I won't even try to
claim knowledge of what decisions hardware folk will make, but I think
it is likely that cbo.zero will share its block size with the other
three cbo instructions that we already support.

idk if you can refer to other properties in a binding, but effectively I
am suggesting:
  riscv,cboz-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    default: riscv,cbom-block-size
    description:
      The blocksize in bytes for the Zicboz cache operations.

>  d. ??

Have both properties and default them to the regular old cache block
sizes, thereby allowing Zicbom/Zicboz in the ISA string without either
property at all?
Or is that one an ABI break? And if it is, do we care since there
doesn't appear to be a linux-capable, Zicbo* compatible SoC yet?

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230123/80e3c33a/attachment-0001.sig>
