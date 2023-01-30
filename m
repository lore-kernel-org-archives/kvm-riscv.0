From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 17:58:49 +0800
Subject: [PATCH -next v13 16/19] riscv: Add V extension to KVM ISA
In-Reply-To: <Y9Q3i2z8uh1Bttzw@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-17-andy.chiu@sifive.com>
 <Y9Q3i2z8uh1Bttzw@spud>
Message-ID: <CABgGipUR1+MRkt5WH8=cEr+9XB3x5TRsMOefu8adFfNkjWZ_nA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 4:44 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jan 25, 2023 at 02:20:53PM +0000, Andy Chiu wrote:
> > riscv: Add V extension to KVM ISA
>
> I figure this should probably be "riscv: kvm:" or some variant with
> more capital letters.
Ok. adding it
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 92af6f3f057c..e7c9183ad4af 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -100,6 +100,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >       KVM_RISCV_ISA_EXT_H,
> >       KVM_RISCV_ISA_EXT_I,
> >       KVM_RISCV_ISA_EXT_M,
> > +     KVM_RISCV_ISA_EXT_V,
> >       KVM_RISCV_ISA_EXT_SVPBMT,
> >       KVM_RISCV_ISA_EXT_SSTC,
> >       KVM_RISCV_ISA_EXT_SVINVAL,
>
> Ehh, this UAPI so, AFAIU, you cannot add this in the middle of the enum
> and new entries must go at the bottom. Quoting Drew: "we can't touch enum
> KVM_RISCV_ISA_EXT_ID as that's UAPI. All new extensions must be added at
> the bottom. We originally also had to keep kvm_isa_ext_arr[] in that
> order, but commit 1b5cbb8733f9 ("RISC-V: KVM: Make ISA ext mappings
> explicit") allows us to list its elements in any order."
>
Thanks to mentioning this potential ABI break, I have moved it to the
end at v14 revision.
@@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
        KVM_RISCV_ISA_EXT_SVINVAL,
        KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
        KVM_RISCV_ISA_EXT_ZICBOM,
+       KVM_RISCV_ISA_EXT_V,
        KVM_RISCV_ISA_EXT_MAX,
 };
>
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 7c08567097f0..b060d26ab783 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >       [KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
> >       [KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
> >       [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> > +     [KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
> >
> >       KVM_ISA_EXT_ARR(SSTC),
> >       KVM_ISA_EXT_ARR(SVINVAL),
>
> This one here is fine however.
Great!
>
> Thanks,
> Conor.

