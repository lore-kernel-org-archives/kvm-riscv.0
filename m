From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 2 Aug 2023 16:30:39 -0700
Subject: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
In-Reply-To: <ZMqABp6OdrgOtsum@google.com>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-2-rananta@google.com>
 <87v8e5r6s6.wl-maz@kernel.org> <CAJHc60wtc2Usei3hKj1ykVRvBZFFCBOHMi9HCxnNvGK2dPFApA@mail.gmail.com>
 <ZMgqueePlmKvgUId@google.com> <CAJHc60xM+KsUKxtoqORnpzrRke4T-sob2uLJRMvBKwruipxnpw@mail.gmail.com>
 <878ratqw2l.wl-maz@kernel.org> <ZMqABp6OdrgOtsum@google.com>
Message-ID: <CAJHc60zvKSoPU6uTzZQCY2ZAeVj18qmu3=U-rUt5er0zGLQ33Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Okay, so just the #define in the respective arch header with a global
declaration. I'll consider this in v8.

Thanks,
Raghavendra

On Wed, Aug 2, 2023 at 9:10?AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Aug 02, 2023, Marc Zyngier wrote:
> > On Tue, 01 Aug 2023 01:42:54 +0100,
> > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > Thanks for the suggestions; I can go with a common declaration. Along
> > > with that, do we want to keep defining
> > > __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS in the arch code that supports it or
> > > convert it into a CONFIG_?
> >
> > This isn't something that a user can select, more something that is an
> > architectural decision. Maybe in a later patch if there is a consensus
> > around that, but probably not as part of this series.
>
> +1.  I agree it's annoying that KVM uses a mix of Kconfigs and manual #defines
> for the various "KVM_HAVE" knobs, but we have so many of both that one-off
> conversions without a real need don't make much sense.

