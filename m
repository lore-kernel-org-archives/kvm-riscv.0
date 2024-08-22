From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 22 Aug 2024 15:41:38 +0200
Subject: [PATCH v2 1/2] riscv: perf: add guest vs host distinction
In-Reply-To: <430f3d38-b12e-4ac8-8040-33bab40380ab@iscas.ac.cn>
References: <cover.1723518282.git.zhouquan@iscas.ac.cn>
 <3729354b59658535c4370d3c1c7e2f162433807b.1723518282.git.zhouquan@iscas.ac.cn>
 <20240821-f5e1d6afb0d2230c1256a75b@orel>
 <430f3d38-b12e-4ac8-8040-33bab40380ab@iscas.ac.cn>
Message-ID: <20240822-a03a7c96ebceb658325e7fce@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 22, 2024 at 02:38:44PM GMT, Quan Zhou wrote:
...
> > > +unsigned short perf_misc_flags(struct pt_regs *regs)
> > 
> > I see that the consumer of perf_misc_flags is only a u16, but all other
> > architectures define this function as returning an unsigned long, and
> > your last version did as well. My comment in the last version was that
> > we should use an unsigned long for the 'misc' variable to match the
> > return type of the function. I still think we should do that instead
> > since the function should be consistent with the other architectures.
> > 
> 
> I agree with your point that the type of `misc` should be consistent with
> other architectures.
> 
> However, one thing confuses me. The return value of perf_misc_flags
> is assigned to the `misc` field of the perf_event_header structure,
> and the field is defined as `u16`. I checked the return type of

Yes, that's what I mentioned above.

> `perf_misc_flags` in other architectures, and I found that for x86/arm/s390,
> the type is `unsigned long`, while for powerpc, it is `u32`.
> These do not match `u16`, which seems to pose a risk of type truncation and
> feels a bit unconventional. Or is there some other reasonable consideration
> behind this?

No, it's just historic. I see three paths, one is use 'unsigned long' like
the other architectures and assume we'll never have flags touching bits
over 15, so it's fine. Or, same as the first path, but also add
'#define PERF_RECORD_MISC_MAX 15' with a comment explaining misc flags
must be 15 or less as a separate patch. Or, for the third, add patches to
this series that first change all architectures to return u16s.

Thanks,
drew

