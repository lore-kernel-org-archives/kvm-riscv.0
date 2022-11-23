From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 23 Nov 2022 14:36:36 +0100
Subject: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
In-Reply-To: <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik>
 <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com>
Message-ID: <20221123133636.gke3626aolfrnevy@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

...
> > > > -     csr_write(CSR_HCOUNTEREN, -1UL);
> > > > +     /* VS should access only TM bit. Everything else should trap */
> > > > +     csr_write(CSR_HCOUNTEREN, 0x02);
> > >
> > > This looks like something that should be broken out into a separate patch
> > > with a description of what happens now when guests try to access the newly
> > > trapping counter registers. We should probably also create a TM define.
> > >
> >
> > Done.
> >
> 
> As we allow cycles & instret for host user space now [1], should we do the same
> for guests as well ? I would prefer not to but same user space
> software will start to break
> they will run inside a guest.
> 
> https://lore.kernel.org/all/20220928131807.30386-1-palmer at rivosinc.com/
>

Yeah, it seems like we should either forbid access to unprivileged users
or ensure the numbers include some random noise. For guests, a privileged
KVM userspace should need to explicitly request access for them, ensuring
that the creation of privileged guests is done by conscious choice.

Thanks,
drew

