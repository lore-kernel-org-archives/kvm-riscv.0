From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:09:57 +0530
Subject: [PATCH 1/4] RISC-V: KVM: Forward SBI experimental and vendor
 extensions
In-Reply-To: <558e7e30-2d87-a19c-c85c-a2993a354074@redhat.com>
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-2-anup.patel@wdc.com>
 <558e7e30-2d87-a19c-c85c-a2993a354074@redhat.com>
Message-ID: <CAAhSdy2mAHyA04nTOh_XM==moKv1UARpmqt2QhkQwFZo98kwtA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 26, 2021 at 9:42 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > +static int kvm_sbi_ext_expevend_handler(struct kvm_vcpu *vcpu,
> > +                                     struct kvm_run *run,
> > +                                     unsigned long *out_val,
> > +                                     struct kvm_cpu_trap *utrap,
> > +                                     bool *exit)
>
> Doesn't really matter what this is used for, it's a handler that
> forwards.  So you can name it kvm_sbi_ext_forward_handler.

Sure, I will rename this to kvm_sbi_ext_forward_handler()

Regards,
Anup

>
> Paolo
>
> > +{
> > +     /*
> > +      * Both SBI experimental and vendor extensions are
> > +      * unconditionally forwarded to userspace.
> > +      */
> > +     kvm_riscv_vcpu_sbi_forward(vcpu, run);
> > +     *exit = true;
> > +     return 0;
> > +}
> > +
>

